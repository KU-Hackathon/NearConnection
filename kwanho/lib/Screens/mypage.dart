import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kwanho/Models/user.dart';

class MyPage extends StatefulWidget {
  USER? user;
  MyPage({required this.user});

  @override
  State<MyPage> createState() => _MyPageState(user);
}

class _MyPageState extends State<MyPage> {
  final USER? _user;

  _MyPageState(this._user);

  @override
  Widget build(BuildContext context) {
    return _user != null ? loginmypage(_user!) : logoutmypage();
  }
}

Drawer loginmypage(USER user) {
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
          accountName: Text(" ${user.nickname}",style: TextStyle(fontSize: 20)),
        ),
      ListTile(title: Text("내가 쓴 게시물"),leading: Icon(Icons.list)),
      ListTile(title: Text("댓글 단 게시물"),leading: Icon(Icons.list)),
      ListTile(title: Text("즐겨찾기한 게시물"),leading: Icon(Icons.list)),

      ],
    ),
  );
}

Drawer logoutmypage() {
  return Drawer(
    child: DrawerHeader(
      child: Container()
    ),
  );
}
