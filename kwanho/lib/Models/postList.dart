import 'package:http/http.dart';

class Post{
  final int id;
  final String author;
  final String authorAge;
  final String title;
  final String contents;
  final String contentsPreview;
  final int likes;
  final int comments;
  final String category;
  final List<String>? tags;

  Post({required this.id,required this.author, required this.authorAge ,required this.title, required this.contents,required this.contentsPreview,required this.comments,required this.likes, required this.category,this.tags});

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'author':author,
      'author_age':authorAge,
      'title':title,
      'content':contents,
      'content_preview':contentsPreview,
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
        authorAge: JsonData['author_age'],
        title: JsonData["title"],
        contents: JsonData["content"],
        contentsPreview: JsonData["content_preview"],
        comments: JsonData['comments'],
        likes: JsonData['like'],
        category: JsonData["category"],
        tags: JsonData['tags']);
  }
}

