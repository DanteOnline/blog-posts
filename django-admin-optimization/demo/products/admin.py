from django.contrib import admin
from django import forms
from .models import Product, Category

class ProductAdminForm(forms.ModelForm):
    category = forms.ModelChoiceField(queryset=Category.objects.select_related('main_category'))

    class Meta:
        model = Product
        fields = "__all__"


class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'category']
    list_select_related = ['category__main_category']
    form = ProductAdminForm

admin.site.register(Product, ProductAdmin)
