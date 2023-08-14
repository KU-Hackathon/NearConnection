from django.db import models


# Create your models here.
class User(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=10)
    age = models.PositiveIntegerField()
    point = models.IntegerField(default=100)


class Comment(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    content = models.TextField()


class Post(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=80)
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    content = models.TextField()
    comments = models.ManyToManyField(Comment)
