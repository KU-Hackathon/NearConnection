import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../Screens/postview.dart';
import 'package:http/http.dart' as http;
import '../Models/post.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostAllListController extends ChangeNotifier{
  List<Post> post = [];
  int currentPageNo = 1;
  bool isAdd = false;

  void scrollListener(ScrollUpdateNotification notification){
    if (notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels){
      _morePosts();
    }
  }

  Future<void> _morePosts () async {
    if(!isAdd){
      isAdd = true;
      notifyListeners();
      List<Post>? _data  = await _fetchPost(pageNo: currentPageNo);
      Future.delayed(const Duration(milliseconds: 1000), (){
        post.addAll(_data);
        currentPageNo += 1;
        isAdd = false;
        notifyListeners();
      });
    }
  }

  Future<void> stated() async{
    await _getPosts();
  }

  Future<void> _getPosts() async {
    List<Post>? _data = await _fetchPost(pageNo: currentPageNo);
    post = _data;
    currentPageNo = 2;
    logger.e(currentPageNo);
    notifyListeners();
  }

  Future<List<Post>> _fetchPost({
    required int pageNo
  }) async {
    try{
      http.Response _response = await http.get(
          Uri.parse("http://203.252.139.208:8000/api_posts_list"));
      if(_response.statusCode == 200){
        List<dynamic> _data = jsonDecode(_response.body);
        List<Post> _result =
        _data.map((e) => Post.fromJson(e)).toList();
        return _result;
      }
      else{
        return [];
      }
    }catch(error){
      logger.e(error);
      return [];
    }
  }
}