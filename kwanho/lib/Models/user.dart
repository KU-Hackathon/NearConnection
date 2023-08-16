
import 'package:flutter/material.dart';

class USER with ChangeNotifier{
  USER({this.isLogined=false,required this.nickname,required this.token});
  String? nickname;
  bool isLogined;
  String? token;

  void Change(){
    notifyListeners();
  }

  fromJson(Map <String,dynamic> JsonData){
    return USER(
        nickname: JsonData['name'],
        token: JsonData['token']);
  }

}