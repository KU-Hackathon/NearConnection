import 'package:flutter/material.dart';
import 'package:kwanho/Models/views.dart';
import 'package:kwanho/Screens/bodybar.dart';
import 'package:kwanho/Screens/login.dart';
import 'package:kwanho/Screens/mypage.dart';
import 'package:kwanho/Screens/postview.dart';
import 'package:provider/provider.dart';
import '../Models/user.dart';
import '../MyTheme.dart';
import 'appbar.dart';
import 'bottom.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  int _selected_index = 0;
  List<AppBar> AppBar_list = [HomeBar(), HotPostBar(),AlarmBar(), SettingBar()];
  List<Widget> Body_list = [Home(), HotPostView(), Alarm(), Setting()];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => USER(token: null, nickname: null),
      child: Scaffold(
        drawer: _selected_index == 0 ? MyPage() : null,
        appBar: AppBar_list[_selected_index],
        body: Body_list[_selected_index],
        bottomNavigationBar: BottomNavigationBar(

          onTap: (int index) {
            setState(() {
              _selected_index = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: _selected_index,
          iconSize: 24,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: botlist,

        ),
      ),
    );
  }


}

AppBar HomeBar() {
  return AppBar(
    title: const Text("니어커넥션", style: TextStyle(color: Colors.white),),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
    ],
  );
}