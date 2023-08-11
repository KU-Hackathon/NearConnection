import 'package:flutter/material.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({super.key});

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("~~게시판"),),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightBlueAccent,onPressed: ()=> Navigator.pushNamed(context, '/PostView/Post'),child: Icon(Icons.add)),
    );
  }
}
