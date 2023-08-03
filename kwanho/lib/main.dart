import 'package:flutter/material.dart';
import 'MyTheme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "니어커넥션",
      theme: THEME1,
      home: Scaffold(
        appBar: AppBar(title: Text("니어커넥션"),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.star),)],
        ),
        body: IconButton(icon: Icon(Icons.star),onPressed: (){},),
        bottomNavigationBar: BottomAppBar(child: Text("HEfsdfasdfasdfasfasdf하하하하하하하히히히미ㅏ기기ㅏㄱㅈ디ㅏㄱㅈ디ㅜ"),),
      ),
    );
  }
}
