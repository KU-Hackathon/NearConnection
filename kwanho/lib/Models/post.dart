import 'dart:ui';

import 'package:http/http.dart';

class Post{
  final String Catogory;
  final String title;
  final String contents;
  final int likes;
  final int chats;
  final List<String> tags = [];
  
  Post({required this.Catogory,this.chats=0,this.likes=0, required this.contents, required this.title});

  Map<String, dynamic> toJson(){

    return {
      'category':Catogory,
      'chats': chats,
      'content':contents,
      'title':title,
      'like':likes,
      'tag':tags,
    };

  }

  factory Post.fromJson(Map <String,dynamic> JsonData){
    return Post(Catogory: JsonData["category"],contents: JsonData["content"], title: JsonData["title"]);
  }
}

class ALARM{
  final String comment;
  final String Catogory;
  final String title;
  ALARM({required this.title, required this.Catogory,required this.comment});
}