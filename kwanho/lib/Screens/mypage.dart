import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kwanho/Models/user.dart';
import 'package:kwanho/Screens/login.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Drawer loginmypage() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color:Colors.lightBlueAccent,
            ),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("images/user.jpg")),
            accountEmail: Text(""),
            accountName: Text(" ${Provider.of<USER>(context).nickname}",style: TextStyle(fontSize: 20)),
          ),
          ListTile(title: Text("내가 쓴 게시물"),leading: Icon(Icons.list)),
          ListTile(title: Text("댓글 단 게시물"),leading: Icon(Icons.list)),
          ListTile(title: Text("즐겨찾기한 게시물"),leading: Icon(Icons.list)),

        ],
      ),
    );
  }

  Drawer logoutmypage() {
    Kakao kakao = new Kakao();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: ElevatedButton(onPressed: () async{
            OAuthToken? token = await kakao.login();
            final suser = await UserApi.instance.me();
            Dio dio = new Dio();
            Response response = await dio.post('http://203.252.139.208:8000/api/login/',queryParameters: {"access_token":token?.accessToken});
            Provider.of<USER>(context,listen: false).fromJson(response.data);
            Provider.of<USER>(context,listen: false).notifyListeners();
          }, child: Text("로그인"))),
          Text(kakao.get_islogined()),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Provider.of<USER>(context,listen: false).token != null ? loginmypage() : logoutmypage();
  }
}
