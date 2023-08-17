# NearConnection
2023년도 건국대학교 해커톤
'관호, 서진, 성현 Let's go'팀의 프로젝트 저장소입니다.

## Members
[@s6xybr8in](https://github.com/s6xybr8in) 남관호 (팀장)  
[@motsuni04](https://github.com/motsuni04) 박서진  
[@Chaesh156](https://github.com/Chaesh156) 채성현

## Feature
프론트엔드: **kwanho/**
백엔드: **backend/**  

## Frontend

### 특징
-flutter를 사용해서 안드로이드와 IOS에서도 똑같은 User Interface를 사용할 수 있습니다.
-Rest Api 에 맞춰 컨트롤러를 제작하여 간편하게 http 통신 할 수 있습니다.
### 실행법
-실행 환경: Flutter 3.10.6 , Dart 3.0.6

## Backend
### 특징
- 토큰 기반 인증을 사용하여 앱 기반 환경에 최적화했습니다.
- API 문서를 자동으로 생성하여 협업에 매우 용이합니다.
> 서버 실행 후 아래의 주소에서 문서를 확인할 수 있습니다.
> http://localhost:8000/schema/redoc
### 실행법
- 실행 환경: `Python 3.10.10, Django 4.2.4`

1. 파이썬 가상환경 활성화  
> cd ./backend  
> python -m venv venv  
> venv/bin/activate  
> pip install -r requirements.txt
2. Django 서버 시작
> python manage.py migrate --run-syncdb
> python manage.py runserver 0.0.0.0:8000
