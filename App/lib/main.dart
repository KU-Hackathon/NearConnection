import 'package:flutter/material.dart';
import 'package:test2/MyTheme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: THEME1,
      home: Scaffold(
        appBar: AppBar(leading:IconButton( icon: Icon(Icons.list,size: 38), onPressed: (){},),title: Text("니어커넥션"),centerTitle: true,),
        body:TextButton(style: ButtonStyle(),child: Text("HI"),onPressed: () {

        },),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
