import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'MyTheme.dart';
import 'Screens/OpenPost.dart';
import 'Screens/login.dart';
import 'Screens/mainpage.dart';
import 'Screens/mypage.dart';
import 'Screens/postview.dart';
import 'Screens/reportPage.dart';


void main() {
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
        '/': (ctx)=>MainPage(), '/Login':(ctx)=>LoginPage(), '/MyPage':(ctx)=>MyPage(),
      },
    );
  }
}