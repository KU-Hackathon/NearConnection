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
  appBarTheme: AppBarTheme(backgroundColor:Colors.lightBlueAccent.shade100,centerTitle: false,iconTheme: IconThemeData(size:30,color: Colors.white)), // 색갈 푸른색 제목 중앙
  textTheme: TextTheme(
    titleLarge: TextStyle(fontFamily: "Aggro",fontSize: 32,fontWeight: FontWeight.normal), // title
    bodyMedium: TextStyle(fontFamily: "Pretendard",fontSize: 18,fontWeight: FontWeight.w500), // 기본
  ),

);

Widget TextTitle1(String S){
  return Text("$S",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Pretendard"),);
}
Widget TEXT1(String string,double size){
  return Text("$string",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
      fontFamily: "Jamsil",fontSize: size,fontWeight: FontWeight.w400),);
}