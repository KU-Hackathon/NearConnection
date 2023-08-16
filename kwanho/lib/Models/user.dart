
import 'package:flutter/material.dart';

class USER with ChangeNotifier{
  USER({required this.nickname,required this.token});
  String? nickname;
  String? token;

  logout(){
    this.nickname = null;
    this.token = null;
  }

  fromJson(Map <String,dynamic> JsonData){
    return USER(
        nickname: JsonData['name'],
        token: JsonData['token']);
  }

}