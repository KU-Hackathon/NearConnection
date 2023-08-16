import 'package:http/http.dart';

class Post{
  final int id;
  final dynamic author;
  final int author_age;
  final String title;
  final String contents;
  final int likes;
  final List<dynamic> comments;
  final String category;
  final List<dynamic>? tags;
  
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
        author: JsonData['author']['name'],
        author_age: JsonData['author']['age'],
        title: JsonData["title"],
        contents: JsonData["content"],
        comments: JsonData['comments'],
        likes: JsonData['likes_count'],
        category: JsonData["board"],
        tags: JsonData['tags']);
  }
}

class ALARM{
  final String comment;
  final String Category;
  final String title;
  ALARM({required this.title, required this.Category,required this.comment});
}
