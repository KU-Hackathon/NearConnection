import 'package:http/http.dart';

class CommentRequest{
  final int postId;
  final String contents;

  CommentRequest({required this.postId, required this.contents});

  Map<dynamic, dynamic> toJson(){
    return {
      'postId':postId,
      'content':contents,
    };
  }
}
