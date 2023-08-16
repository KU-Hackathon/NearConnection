import 'package:flutter/material.dart';
import 'package:kwanho/Models/views.dart';
import 'package:kwanho/Screens/bodybar.dart';
import 'package:kwanho/Screens/mypage.dart';
import 'package:kwanho/Screens/postview.dart';
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
  USER? _user = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = USER(nickname: "홍홍홍",isLogined: true);
  }
  int _selected_index = 0;
  List<AppBar> AppBar_list = [HomeBar(),HotPostBar(),AlarmBar(),SettingBar()];
  List<Widget> Body_list = [Home(),HotPostView(),Alarm(),Setting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _selected_index == 0 ? MyPage(user: _user,) : null,
      appBar: AppBar_list[_selected_index],
      body: Body_list[_selected_index],
      bottomNavigationBar: BottomNavigationBar(

        onTap: (int index){
          setState(() {
            _selected_index = index;
          });
        },
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selected_index,
        iconSize: 24,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: botlist,

      ),
    );
  }
}


