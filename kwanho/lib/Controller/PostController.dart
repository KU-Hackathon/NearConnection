import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:flutter/cupertino.dart';

import '../Screens/postview.dart';
import 'package:http/http.dart' as http;
import '../Models/post.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostController extends ChangeNotifier{
  List<Post> post = [];
  int currentPageNo = 1;
  bool isAdd = false;

  void scrollListener(ScrollUpdateNotification notification,String category){
    if (notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels){
      _morePosts(category: category);
    }
  }

  Future<void> _morePosts ({required String category}) async {
    if(!isAdd){
      isAdd = true;
      notifyListeners();
      List<Post>? _data  = await _fetchPost(pageNo: currentPageNo, category: category);
      Future.delayed(const Duration(milliseconds: 1000), (){
        post.addAll(_data);
        currentPageNo += 1;
        isAdd = false;
        notifyListeners();
      });
    }
  }

  Future<void> stated({required String category}) async{
    await _getPosts(category: category);
  }

  Future<void> _getPosts({required String category}) async {
    List<Post>? _data = await _fetchPost(pageNo: currentPageNo,category: category);
    post = _data;
    currentPageNo = 2;
    logger.e(currentPageNo);
    notifyListeners();
  }

  Future<List<Post>> _fetchPost({
    required int pageNo,required String category
}) async {
    try{
      http.Response _response = await http.get(
        Uri.parse(""));
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