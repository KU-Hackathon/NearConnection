from django.urls import path
from . import views

post_list = views.PostPreviewSet.as_view(
    {
        'get': 'list'
    }
)

post_upload = views.PostViewSet.as_view(
    {
        'post': 'create'
    }
)

post_detail = views.PostViewSet.as_view(
    {
        'get': 'retrieve',
        'patch': 'partial_update',
        'delete': 'destroy'
    }
)

urlpatterns = [
    # path('login', views.LoginView.as_view()),
    path('posts/', post_list),
    path('posts/', post_upload),
    path('posts/<int:pk>/', post_detail),
]
