import 'package:http/http.dart';

class PostRequest{
  final String title;
  final String contents;
  final String category;
  final List<String>? tags;

  PostRequest({required this.title, required this.contents,required this.category,this.tags});

  Map<dynamic, dynamic> toJson(){
    return {
      'title':title,
      'content':contents,
      'board':category,
      'tags':tags
    };
  }
}
