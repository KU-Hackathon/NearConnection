import 'dart:convert';
import 'dart:io';
import 'package:kwanho/Models/Token.dart';
import 'package:logger/logger.dart';
import 'package:flutter/cupertino.dart';

import '../Screens/postview.dart';
import 'package:http/http.dart' as http;
import '../Models/post.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostController extends ChangeNotifier{
  Post post = new Post(id: 0, author: [], author_age: 0, title: "null", contents: "null", comments: [], likes: 0, category: "null");
  int currentPageNo = 1;
  bool isAdd = false;
  Token token = Token();

  Future<void> stated({required int postId}) async{
    await _getPosts(postId: postId);
  }

  Future<void> _getPosts({required int postId}) async {
    Post? _data = await _fetchPost(postId: postId);
    post = _data;
    notifyListeners();
  }

  Future<Post> _fetchPost({
    required int postId
}) async {
      http.Response _response = await http.get(
          Uri.parse("http://203.252.139.208:8000/api/posts/$postId"),
          headers: {
            HttpHeaders.authorizationHeader: token.token}
      );
      try{
      if(_response.statusCode == 200){
        Map<String,dynamic> _data = jsonDecode(utf8.decode(_response.bodyBytes));
        Post result = Post.fromJson(_data);
        return result;
      }
      else{
        return Post(id: -1, author: [], author_age: -1, title: "error", contents: "error", comments: [], likes: -1, category: "error");
      }
    }catch(error){
      logger.e(error);
      return Post(id: -1, author: [], author_age: -1, title: "error", contents: "error", comments: [], likes: -1, category: "error");
    }
  }
}