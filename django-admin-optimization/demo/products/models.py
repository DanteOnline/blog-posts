from django.db import models

class MainCategory(models.Model):
    name = models.CharField(max_length=16)

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=16)
    main_category = models.ForeignKey(MainCategory, null=True, blank=True, on_delete=models.SET_NULL)

    def __str__(self):
        return f'{self.name} - {self.main_category}'


class Product(models.Model):
    name = models.CharField(max_length=16)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
