from rest_framework import serializers
from .models import User, Comment, Post


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('created_at', 'name', 'age', 'point')


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('created_at', 'author', 'content')


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ('created_at', 'updated_at', 'title', 'author', 'content', 'comments')
