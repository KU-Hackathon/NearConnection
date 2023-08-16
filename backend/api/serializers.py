from rest_framework import serializers
from .models import *


class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'created_at', 'name', 'age', 'point']


class CommentSerializer(serializers.ModelSerializer):
    author = serializers.CharField(source='author.name', read_only=True)
    author_age = serializers.IntegerField(source='author.age', read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'created_at', 'author', 'author_age', 'content']


class PostSerializer(serializers.ModelSerializer):
    author = ProfileSerializer(read_only=True)
    tags = serializers.StringRelatedField(many=True)
    likes = serializers.IntegerField(source='len(comments)', read_only=True)
    comments = CommentSerializer(many=True, read_only=True)

    class Meta:
        model = Post
        fields = ['id', 'created_at', 'updated_at', 'board', 'title', 'author',
                  'content', 'tags', 'likes', 'comments']
        read_only_fields = ['created_at', 'updated_at']
        lookup_field = 'title'


class PostPreviewSerializer(serializers.ModelSerializer):
    author = serializers.CharField(source='author.name', read_only=True)
    author_age = serializers.IntegerField(source='author.age', read_only=True)
    tags = serializers.StringRelatedField(many=True)
    likes = serializers.IntegerField(source='len(likes)', read_only=True)
    comments = serializers.IntegerField(source='len(comments)', read_only=True)

    class Meta:
        model = Post
        fields = ['id', 'created_at', 'board', 'title', 'content_preview',
                  'author', 'author_age', 'tags', 'likes', 'comments']
        read_only_fields = ['created_at', 'board', 'title']
