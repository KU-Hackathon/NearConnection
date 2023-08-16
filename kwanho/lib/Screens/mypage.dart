import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kwanho/Models/user.dart';
import 'package:kwanho/Screens/login.dart';
import 'package:kwanho/Screens/writtenview.dart';
import 'package:provider/provider.dart';
import '../Models/Token.dart' as RealToken;
import '../Models/post.dart';
import '../Models/postList.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<USER>(context).token == null) {
      USER user = Provider.of<USER>(context);
      Kakao kakao = new Kakao();
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: ElevatedButton(
                    onPressed: () async {
                      OAuthToken? token = await kakao.login();
                      Dio dio = new Dio();
                      Response response = await dio.post(
                          'http://203.252.139.208:8000/api/login/',
                          queryParameters: {
                            "access_token": token?.accessToken
                          });
                      user = user.fromJson(response.data);
                      RealToken.token = user.token;
                      Provider.of<USER>(context,listen: false).token = user.token;
                      Provider.of<USER>(context,listen: false).nickname = user.nickname;
                      Provider.of<USER>(context,listen: false).notifyListeners();
                    },
                    child: Text("로그인"))),
          ],
        ),
      );
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage("assets/images/user.jpg")),
            accountEmail: Text(""),
            accountName: Text(" ${Provider.of<USER>(context).nickname}",
                style: TextStyle(fontSize: 20)),
          ),
          ListTile(title: Text("내가 쓴 게시물"), leading: Icon(Icons.list),
            onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WrittenView()));
          }
              ),
              ListTile(title: Text("댓글 단 게시물"), leading: Icon(Icons.list)),
              ListTile(title: Text("즐겨찾기한 게시물"), leading: Icon(Icons.list)),
              ListTile(
              title: Text("로그아웃"),
              leading: Icon(Icons.logout),
              onTap: (){
                RealToken.token = null;
              Provider.of<USER>(context,listen: false).nickname = null;
              Provider.of<USER>(context,listen: false).token = null;
              Provider.of<USER>(context,listen: false).notifyListeners();
              }
              )

        ],
      ),
    );
  }
}
