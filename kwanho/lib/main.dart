import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'MyTheme.dart';
import 'Screens/login.dart';
import 'Screens/mainpage.dart';
import 'Screens/mypage.dart';
import 'Screens/post.dart';
import 'Screens/postview.dart';


void main() {
  KakaoSdk.init(nativeAppKey: "d0f7fb41814be47b93fb15915412775a");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "니어커넥션",
      theme: THEME1,
      initialRoute: '/',
      routes: {
        '/': (ctx)=>MainPage(), '/Login':(ctx)=>LoginPage(),'/PostView':(ctx)=>PostViewPage(),
        '/PostView/Post':(ctx)=>PostPage(), '/MyPage':(ctx)=>MyPage()
      },
    );
  }
}