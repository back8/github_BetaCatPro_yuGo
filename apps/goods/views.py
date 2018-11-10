from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.views.generic import View
from django.core.cache import cache
from django.core.paginator import Paginator
from goods.models import GoodsSKU,GoodsType
from django_redis import get_redis_connection
from order.models import OrderGoods,OrderInfo
# Create your views here.

# http://127.0.0.1:8000
class IndexView(View):
	'''首页'''
	def get(self, request):
		types = GoodsType.objects.all()
		goods = GoodsSKU.objects.all()[:5]
		contex = {'types':types,
						'goods':goods
		}
		return render(request, 'index.html',contex)

# /goods/商品id
class DetailView(View):
	'''详情页'''
	def get(self, request, goods_id):
		'''显示详情页'''
		try:
			sku = GoodsSKU.objects.get(id=goods_id)
		except GoodsSKU.DoesNotExist:
			# 商品不存在
			return redirect(reverse('goods:index'))

		# 获取商品的分类信息
		types = GoodsType.objects.all()

		#相关产品
		goods = GoodsSKU.objects.filter(type=sku.type)[:4]


		#获取商品的评论信息
		sku_orders = OrderGoods.objects.filter(sku=sku).exclude(comment='')

		# 获取同一个SPU的其他规格商品
		# same_spu_skus = GoodsSKU.objects.filter(goods=sku.goods).exclude(id=goods_id)

		# 获取用户购物车中商品的数目
		user = request.user
		if user.is_authenticated():
			# 添加用户的历史记录
			conn = get_redis_connection('default')
			history_key = 'history_%d'%user.id
			# 移除列表中的goods_id
			conn.lrem(history_key, 0, goods_id)
			# 把goods_id插入到列表的左侧
			conn.lpush(history_key, goods_id)
			# 只保存用户最新浏览的5条信息
			conn.ltrim(history_key, 0, 4)

		# 组织模板上下文
		context = {'sku':sku,
			'types':types,
			'goods':goods,
			'comment':sku_orders,
			}

		return render(request, 'goods-detail.html', context)


# 种类id 页码 排序方式
# restful api -> 请求一种资源
# /list?type_id=种类id&page=页码&sort=排序方式
# /list/种类id/页码/排序方式
# /list/种类id/页码?sort=排序方式
class ListView(View):
	'''列表页'''
	def get(self, request, type_id, page):
		'''显示列表页'''
		# 获取种类信息

		# 获取商品的分类信息
		types = GoodsType.objects.all()

		try:
			type = GoodsType.objects.get(id=type_id)
		except GoodsType.DoesNotExist:
			# 种类不存在
			skus = GoodsSKU.objects.all()

			paginator = Paginator(skus, 12)

			try:
				page = int(page)
			except Exception as e:
				page = 1

			if page > paginator.num_pages:
				page = 1

			skus_page = paginator.page(page)
			print('----------------------------')
			print(skus_page)
			num_pages = paginator.num_pages
			if num_pages < 5:
				pages = range(1, num_pages+1)
			elif page <= 3:
				pages = range(1, 6)
			elif num_pages - page <= 2:
				pages = range(num_pages-4, num_pages+1)
			else:
				pages = range(page-2, page+3)

			context = {'skus':skus,
				'type':{'id':0},
				'types':types,
				'skus_page':skus_page,
				'sort':'default',
				'pages':pages
			}
			return render(request,'good-list.html',context)

		# 获取排序的方式 # 获取分类商品的信息
		# sort=default 按照默认id排序
		# sort=price 按照商品价格排序
		# sort=hot 按照商品销量排序
		sort = request.GET.get('sort')

		if sort == 'price':
			skus = GoodsSKU.objects.filter(type=type).order_by('price')
		elif sort == 'hot':
			skus = GoodsSKU.objects.filter(type=type).order_by('-sales')
		else:
			sort = 'default'
			skus = GoodsSKU.objects.filter(type=type).order_by('-id')

		# 对数据进行分页
		paginator = Paginator(skus, 12)

		# 获取第page页的内容
		try:
			page = int(page)
		except Exception as e:
			page = 1

		if page > paginator.num_pages:
			page = 1

		# 获取第page页的Page实例对象
		skus_page = paginator.page(page)
		print('----------------------------')
		print(skus_page)

		# todo: 进行页码的控制，页面上最多显示5个页码
		# 1.总页数小于5页，页面上显示所有页码
		# 2.如果当前页是前3页，显示1-5页
		# 3.如果当前页是后3页，显示后5页
		# 4.其他情况，显示当前页的前2页，当前页，当前页的后2页
		num_pages = paginator.num_pages
		if num_pages < 5:
			pages = range(1, num_pages+1)
		elif page <= 3:
			pages = range(1, 6)
		elif num_pages - page <= 2:
			pages = range(num_pages-4, num_pages+1)
		else:
			pages = range(page-2, page+3)


		# 组织模板上下文
		context = {'type':type, 'types':types,
			'skus_page':skus_page,
			'pages':pages,
			'skus':skus,
			'sort':sort}

		return render(request, 'good-list.html', context)