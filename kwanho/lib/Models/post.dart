import 'package:http/http.dart';

class Post{
  final int id;
  final String author;
  final String author_age;
  final String title;
  final String contents;
  final int likes;
  final int comments;
  final String category;
  final List<String>? tags;
  
  Post({required this.id,required this.author, required this.author_age ,required this.title, required this.contents,required this.comments,required this.likes, required this.category,this.tags});

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'author':author,
      'author_age':author_age,
      'title':title,
      'content':contents,
      'comments': comments,
      'likes':likes,
      'category':category,
      'tags':tags
    };

  }

  factory Post.fromJson(Map <String,dynamic> JsonData){
    return Post(
        id: JsonData['id'],
        author: JsonData['author'],
        author_age: JsonData['author_age'],
        title: JsonData["title"],
        contents: JsonData["content"],
        comments: JsonData['comments'],
        likes: JsonData['like'],
        category: JsonData["category"],
        tags: JsonData['tags']);
  }
}

class ALARM{
  final String comment;
  final String Catogory;
  final String title;
  ALARM({required this.title, required this.Catogory,required this.comment});
}
