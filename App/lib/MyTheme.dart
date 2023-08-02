import 'package:flutter/material.dart';

final THEME1 = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlueAccent,),
    textTheme:
    TextTheme(
        titleLarge: TextStyle(fontFamily: "Aggro",fontWeight: FontWeight.normal,fontSize: 28,color: Colors.black),
        bodyLarge: TextStyle(fontFamily: "Pretendard",fontWeight: FontWeight.w800),
        bodyMedium: TextStyle(fontFamily: "Pretendard",fontWeight: FontWeight.w600,fontSize: 18),
        bodySmall: TextStyle(fontFamily: "Pretendard",fontWeight: FontWeight.w300)
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
      )
    ),elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
      )
)
);
