from django.contrib.auth.models import User
from django.db import models


class BaseModel(models.Model):
    objects = models.Manager()

    class Meta:
        abstract = True


class Profile(BaseModel):
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    kakao_id = models.PositiveIntegerField()
    name = models.CharField(max_length=10)
    age = models.PositiveIntegerField()
    point = models.IntegerField(default=100)

    def __str__(self):
        return f"{self.name}({self.kakao_id})"


class Like(BaseModel):
    created_at = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(Profile, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.author)


class Comment(BaseModel):
    created_at = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(Profile, on_delete=models.CASCADE)
    content = models.TextField()

    def __str__(self):
        return f"{self.author}: {self.content}"


class Tag(BaseModel):
    name = models.CharField(max_length=16)

    def __str__(self):
        return self.name


class Post(BaseModel):
    class BoardChoices(models.TextChoices):
        BOARD_10 = '10', '10대 게시판'
        BOARD_20 = '20', '20대 게시판'
        BOARD_30 = '30', '30대 게시판'
        BOARD_40 = '40', '40대 게시판'
        BOARD_50_above = '50', '50+ 게시판'
        BOARD_HOT = '100', 'HOT 게시판'

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    board = models.CharField(max_length=20, choices=BoardChoices.choices)
    title = models.CharField(max_length=80)
    author = models.ForeignKey(Profile, on_delete=models.CASCADE)
    content = models.TextField(max_length=5000)
    tags = models.ManyToManyField(Tag)
    likes = models.ManyToManyField(Like)
    comments = models.ManyToManyField(Comment)

    def __str__(self):
        return f"{self.board}: {self.author}: {self.title}"

    @property
    def content_preview(self) -> str:
        return (self.content[:25] + "…") if len(str(self.content)) > 25 else self.content


class Report(BaseModel):
    created_at = models.DateTimeField(auto_now_add=True)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    title = models.CharField(max_length=80)
    author = models.ForeignKey(Profile, on_delete=models.CASCADE)
    content = models.TextField()
