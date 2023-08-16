import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Kakao _kakao = new Kakao();
  OAuthToken? token;
  void initState() {
    // TODO: implement initState
    super.initState();
    KakaoSdk.init(nativeAppKey: "d0f7fb41814be47b93fb15915412775a",javaScriptAppKey: "36ac06aa54383d60e693d8044663e5cd");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로그인")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${_kakao.get_islogined()}",style: TextStyle(fontSize: 30),),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async{
                    token  = await _kakao.login();
                    User user = await UserApi.instance.me();
                    print("${user.kakaoAccount}");
                    try{
                      Response response;
                      Dio dio= new Dio();
                      response = await dio.post(
                          'http://seojin.ddns.net/api/login',
                          data: {"access_token": "${token?.accessToken}"},
                          options: Options(headers: {
                            "Authorization":"Token"
                      }
                      ));
                    }catch(error){
                      print("Fail");
                    }
                  },
                  child: Text("Login")),
              ElevatedButton(onPressed: (){
                _kakao.logout();
              }, child: Text("Logout")),
            ],
          ),
        ],
      ),
    );
  }
}

class Kakao {
  bool _islogined = false;
  String get_islogined() {
    return this._islogined.toString();
  }
  void logout() async{
    try {
      await UserApi.instance.logout();
      _islogined = false;
      print("logout");
    }catch(e){
      print("fail logout");
    }
  }
  Future<OAuthToken?> login() async {

    if (await isKakaoTalkInstalled()) {
      print("remove");
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        _islogined = true;
        return token;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          _islogined = true;
          return token;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      print("install");
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        _islogined = true;
        return token;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return null;
      }
    }
  }
}
