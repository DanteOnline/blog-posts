from django.contrib import admin
from .models import Product

class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'category']
    list_select_related = ['category__main_category']

admin.site.register(Product, ProductAdmin)
