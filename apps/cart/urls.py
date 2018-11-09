from django.conf.urls import url
from cart.views import CartAddView, CartInfoView, CartUpdateView, CartDeleteView,HeartAddView,HeartInfoView,HeartDeleteView

urlpatterns = [
	url(r'^add$', CartAddView.as_view(), name='add'), # 购物车记录添加
	url(r'^$', CartInfoView.as_view(), name='show'), # 购物车页面显示
	url(r'^update$', CartUpdateView.as_view(), name='update'), # 购物车记录更新
	url(r'^delete$', CartDeleteView.as_view(), name='delete'), # 购物车记录删除

	url(r'^addheart$', HeartAddView.as_view(), name='addheart'), # 收藏夹记录添加
	url(r'^heartshow$', HeartInfoView.as_view(), name='heartshow'), # 收藏夹页面显示
	url(r'^heartdelete$', HeartDeleteView.as_view(), name='heartdelete'), # 收藏夹页面显示
]
