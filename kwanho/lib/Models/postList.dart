import 'package:http/http.dart';

class PostList{
  final int id;
  final String author;
  final int authorAge;
  final String title;
  final String contentsPreview;
  final int likes;
  final int comments;
  final String category;
  final List<dynamic>? tags;

  PostList({required this.id,required this.author, required this.authorAge ,required this.title,required this.contentsPreview,required this.comments,required this.likes, required this.category,this.tags});

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'author':author,
      'author_age':authorAge,
      'title':title,
      'content_preview':contentsPreview,
      'comments': comments,
      'likes':likes,
      'board':category,
      'tags':tags
    };

  }

  factory PostList.fromJson(Map <String,dynamic> jsonData){
    return PostList(
        id: jsonData['id'],
        author: jsonData['author'],
        authorAge: jsonData['author_age'],
        title: jsonData["title"],
        contentsPreview: jsonData["content_preview"],
        comments: jsonData['comments'],
        likes: jsonData['likes'],
        category: jsonData["board"],
        tags: jsonData['tags']);
  }
}

