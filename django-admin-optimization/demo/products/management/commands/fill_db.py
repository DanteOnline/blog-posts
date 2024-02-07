from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from products.models import Category, Product, MainCategory


class Command(BaseCommand):
    help = "Fill Db"

    def handle(self, *args, **options):
        MainCategory.objects.all().delete()

        main_categories = []
        for i in range(5):
            category = MainCategory(name=f'MainCategory_{i}')
            main_categories.append(category)

        MainCategory.objects.bulk_create(main_categories)

        main_categories = MainCategory.objects.all()

        categories = []
        for main_category in main_categories:
            for i in range(5):
                category = Category(name=f'Category_{i}', main_category=main_category)
                categories.append(category)

        Category.objects.bulk_create(categories)

        categories = Category.objects.all()

        products = []
        for category in categories:
            for i in range(2):
                product = Product(category=category, name=f'Product_{i}')
                products.append(product)

        Product.objects.bulk_create(products)

        User.objects.all().delete()
        User.objects.create_superuser('admin', 'admin@admin.com', 'admin')