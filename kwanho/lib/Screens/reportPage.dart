import 'package:flutter/material.dart';

class Post{

}


class ReportPage extends StatelessWidget {
  const ReportPage ({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title: Text("신고"),
          ),
          body: Column(
            children: [
              Container(
                child: Center()
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '신고 사유'
                  ),
                )
              ),
              Container(
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),onPressed: (){}, child: Text('신고',style: TextStyle(color: Colors.black),))
              ),
            ],
          ),
        )
    );
  }
}
