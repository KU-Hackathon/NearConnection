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
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: "d0f7fb41814be47b93fb15915412775a",
      javaScriptAppKey: "36ac06aa54383d60e693d8044663e5cd");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "니어커넥션",
      theme: THEME1,
      home: MainPage(),
    );
  }
}