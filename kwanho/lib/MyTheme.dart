import 'package:flutter/material.dart';

final THEME1 = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textButtonTheme: TextButtonThemeData(style: ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
  )),
  iconButtonTheme: IconButtonThemeData(style: ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
  )),
  appBarTheme: AppBarTheme(backgroundColor:Colors.lightBlueAccent,centerTitle: true), // 색갈 푸른색 제목 중앙
  textTheme: TextTheme(
    titleLarge: TextStyle(fontFamily: "Aggro",fontSize: 28,fontWeight: FontWeight.normal), // title
    bodyMedium: TextStyle(fontFamily: "Pretendard",fontSize: 18,fontWeight: FontWeight.w500), // 기본
  ),

);