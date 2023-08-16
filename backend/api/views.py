import json

import requests
from django.contrib.auth.models import AnonymousUser
from django.http import Http404
from drf_spectacular.utils import extend_schema, OpenApiParameter, inline_serializer
from rest_framework import viewsets
from rest_framework.authtoken.models import Token
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import *

CLIENT_ID = '746a07f94d32e9cefc8e8987441808df'


class PostPagination(PageNumberPagination):
    max_page_size = 40


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated]

    @extend_schema(
        request={
            'application/json': {
                'type': 'object',
                'properties': {
                    'board': {'type': 'string'},
                    'title': {'type': 'string'},
                    'content': {'type': 'string'}
                }
            }
        }
    )
    def create(self, request, *args, **kwargs):
        profile = Profile.objects.get(user=self.request.user)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        post = Post.objects.create(
            board=body['board'],
            title=body['title'],
            author=profile,
            content=body['content']
        )
        post.save()
        return Response(None, 201)


class PostPreviewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostPreviewSerializer
    permission_classes = [AllowAny]
    authentication_classes = []

    def get_queryset(self):
        board = self.request.GET.get('board')
        query = Post.objects.filter(board=board) if board else Post.objects.all()
        if not isinstance(self.request.user, AnonymousUser):
            profile = Profile.objects.get(user=self.request.user)
            if self.request.GET.get('author'):
                query = query.filter(author=profile)
            if self.request.GET.get('commented'):
                query = query.filter(likes__in=Like.objects.filter(author=profile))
        query = query.order_by('-created_at')
        return query

    @extend_schema(
        parameters=[
            OpenApiParameter(name='board', type=str),
            OpenApiParameter(name='author', type=bool),
            OpenApiParameter(name='commented', type=bool),
        ]
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)


class CommentView(APIView):
    permission_classes = [IsAuthenticated]

    @extend_schema(
        parameters=[OpenApiParameter(name='content', type=str, required=True)],
        responses={201: None}
    )
    def post(self, request, pk: int):
        post = Post.objects.get(id=pk)
        profile = Profile.objects.get(user=request.user)
        post.comments.add(Comment.objects.create(author=profile, content=request.GET['content']))
        return Response(status=201)


class LikeView(APIView):
    permission_classes = [IsAuthenticated]

    @extend_schema(
        parameters=[],
        responses={
            201: None,
            409: None
        }
    )
    def post(self, request, pk: int):
        post = Post.objects.get(id=pk)
        profile = Profile.objects.get(user=request.user)
        for like in post.likes.all():
            if like.author == profile:
                return Response(status=409)
        post.likes.add(Like.objects.create(author=profile))
        return Response(status=201)

    @extend_schema(
        responses={
            200: inline_serializer(
                name='s1',
                fields={
                    'liked': serializers.BooleanField()
                }
            )
        }
    )
    def get(self, request, pk: int):
        post = Post.objects.get(id=pk)
        profile = Profile.objects.get(user=request.user)
        try:
            post.likes.get(author=profile)
            found = True
        except Like.DoesNotExist:
            found = False
        return Response({'liked': found}, status=200)


class LoginView(APIView):
    permission_classes = [AllowAny]
    authentication_classes = []

    @extend_schema(
        parameters=[
            OpenApiParameter('access_token', str, required=True)
        ],
        responses={
            201: inline_serializer(
                name='s2',
                fields={
                    'token': serializers.CharField(),
                    'name': serializers.CharField()
                }
            )
        }
    )
    def post(self, request):
        access_token = request.GET.get('access_token')
        if access_token is None:
            raise Http404('access_token이 주어지지 않았습니다.')
        kakao_user_api = 'https://kapi.kakao.com/v2/user/me'
        response = requests.get(kakao_user_api, headers={'authorization': f'Bearer ${access_token}'})
        if not response.ok:
            raise Http404('카카오 인증 정보가 올바르지 않습니다.')
        kakao_id = response.json()['id']

        try:
            user = Profile.objects.get(kakao_id=kakao_id).user
            token = Token.objects.get(user=user)
        except Profile.DoesNotExist:
            user = User.objects.create(username=f'kakao{kakao_id}')
            token = Token.objects.create(user=user)
            profile = Profile(user=user, kakao_id=kakao_id, name=user.username, age=20)

            user.save()
            profile.save()

        return Response({'token': token.key, 'name': user.username}, 201)
