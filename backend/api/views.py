import requests
from django.http import Http404
from drf_spectacular.utils import extend_schema, OpenApiParameter, inline_serializer, OpenApiResponse
from rest_framework import viewsets
from rest_framework.authtoken.models import Token
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import *
from .models import Profile

CLIENT_ID = '746a07f94d32e9cefc8e8987441808df'


class PostPagination(PageNumberPagination):
    max_page_size = 40


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated]


class PostPreviewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostPreviewSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        board = self.request.GET.get('board')
        return Post.objects.filter(board=board) if board else Post.objects.all()

    @extend_schema(
        parameters=[
            OpenApiParameter(name='board', type=str)
        ]
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)


class LoginView(APIView):
    @extend_schema(
        parameters=[
            OpenApiParameter('access_token', str, required=True)
        ],
        responses={
            201: inline_serializer(
                name='s',
                fields={
                    'user_token': serializers.CharField(),
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
