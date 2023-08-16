import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:kwanho/Models/postList.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import '../Models/Token.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostAllListController extends ChangeNotifier{
  List<PostList> postList = [];
  int currentPageNo = 1;
  bool isAdd = false;

  void scrollListener(ScrollUpdateNotification notification){
    if (notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels){
      _morePostsList();
    }
  }
  void scrollListenerByBoard(ScrollUpdateNotification notification,String category){
    if (notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels){
      _morePostsListByBoard(category);
    }
  }

  Future<void> _morePostsList () async {
    if(!isAdd){
      isAdd = true;
      notifyListeners();
      List<PostList>? _data  = await _fetchPostList(pageNo: currentPageNo);
      Future.delayed(const Duration(milliseconds: 1000), (){
        postList.addAll(_data);
        currentPageNo += 1;
        isAdd = false;
        notifyListeners();
      });
    }
  }

  Future<void> _morePostsListByBoard (String category) async {
    if(!isAdd){
      isAdd = true;
      notifyListeners();
      List<PostList>? _data  = await _fetchPostList(pageNo: currentPageNo,category: category);
      Future.delayed(const Duration(milliseconds: 1000), (){
        postList.addAll(_data);
        currentPageNo += 1;
        isAdd = false;
        notifyListeners();
      });
    }
  }

  Future<void> statedList(String? category) async{
    (category == null)? await _getPostsList(): await _getPostsListByBoard(category);
  }

  Future<void> _getPostsList() async {
    List<PostList>? _data = await _fetchPostList(pageNo: currentPageNo);
    postList = _data;
    currentPageNo = 2;
    notifyListeners();
  }
  Future<void> _getPostsListByBoard(String? category) async {
    List<PostList>? _data = await _fetchPostList(pageNo: currentPageNo,category: category);
    postList = _data;
    currentPageNo = 2;
    notifyListeners();
  }

  Future<List<PostList>> _fetchPostList({
    required int pageNo,
    String? category
  }) async {
    String base_uri = (category != null)? "http://203.252.139.208:8000/api/posts/?board=$category" : "http://203.252.139.208:8000/api/posts/";
    try{
      http.Response _response = await http.get(
          Uri.parse(base_uri),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"}
          );
      if(_response.statusCode == 200){
        List<dynamic> _data = jsonDecode(utf8.decode(_response.bodyBytes));
        List<PostList> _result =
        _data.map((e) => PostList.fromJson(e)).toList();
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