
import 'package:flutter/material.dart';

AppBar HomeBar(){
  return AppBar(title: const Text( "니어커넥션",style: TextStyle(color: Colors.white),),
actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
  );
}
AppBar HotPostBar()
{
  return AppBar(title: const Text( "HOT 게시판",style: TextStyle(color: Colors.white),),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
  );
}
AppBar AlarmBar(){
  return AppBar(title: const Text( "알림",style: TextStyle(color: Colors.white),),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
  );
}
AppBar SettingBar(){
  return AppBar(title: const Text( "설정",style: TextStyle(color: Colors.white),),
  );
}