from django.contrib import admin
from user.models import User,Address

# Register your models here.

class UserAdmin(admin.ModelAdmin):
	list_display = ()

class AddressAdmin(admin.ModelAdmin):
	list_display = ('user','receiver','addr','zip_code','phone','is_default')

admin.site.register(User, UserAdmin)
admin.site.register(Address, AddressAdmin)