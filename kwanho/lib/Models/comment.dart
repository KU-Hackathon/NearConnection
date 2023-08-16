import 'package:http/http.dart';

class Comment{
  final int id;
  final int postId;
  final String author;
  final String author_age;
  final String contents;
  final int likes;
  final List<int>? reCommentId;

  Comment({required this.id, required this.author,required this.author_age,required this.postId,required this.contents, required this.likes,this.reCommentId});

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'postId':postId,
      'author':author,
      'author_age':author_age,
      'content':contents,
      'like':likes,
      'reCommentId':reCommentId
    };

  }

  factory Comment.fromJson(Map <String,dynamic> JsonData){
    return Comment(
      id: JsonData["id"],
      postId: JsonData["postId"],
      author: JsonData["author"],
      author_age: JsonData["author_age"],
      contents: JsonData["content"],
      likes: JsonData["likes"],
      reCommentId: JsonData["reCommentId"]);
  }
}

