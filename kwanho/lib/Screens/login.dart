import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class Kakao {
  bool _islogined = false;

  String get_islogined() {
    return this._islogined.toString();
  }

  void logout() async {
    try {
      await UserApi.instance.logout();
      _islogined = false;
      print("logout");
    } catch (e) {
      print("fail logout");
    }
  }

  Future<OAuthToken?> login() async {
    if(await isKakaoTalkInstalled()){
      print("카톡 설치되잇음");
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        _islogined = true;
        return token;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        return null;
      }
    }else{
      print("카톡 설치 안되잇음");
    }
  }
}
