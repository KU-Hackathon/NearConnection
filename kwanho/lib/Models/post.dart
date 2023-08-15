import 'package:http/http.dart';

class Post{
  final String title;
  final String contents;
  final int likes;
  final int chats;
  final List<String> tags = [];
  
  Post({this.chats=0,this.likes=0, required this.contents, required this.title});

  Map<String, dynamic> toJson(){

    return {
      'chats': chats,
      'content':contents,
      'title':title,
      'like':likes,
      'tag':tags,
    };

  }

  factory Post.fromJson(Map <String,dynamic> JsonData){
    return Post(contents: JsonData["content"], title: JsonData["title"]);
  }
}

