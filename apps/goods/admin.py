from django.contrib import admin
from goods.models import GoodsType,GoodsSKU,Goods,GoodsImage

# Register your models here.

class GoodsTypeAdmin(admin.ModelAdmin):
	list_display = ('name','logo','image')

class GoodsSKUAdmin(admin.ModelAdmin):
	list_display = ('type','goods','name','desc','price','unite','image','stock','sales','status')

class GoodsAdmin(admin.ModelAdmin):
	list_display = ('name','detail')

class GoodsImageAdmin(admin.ModelAdmin):
	list_display = ('sku','image')

admin.site.register(GoodsType, GoodsTypeAdmin)
admin.site.register(GoodsSKU, GoodsSKUAdmin)
admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsImage, GoodsImageAdmin)