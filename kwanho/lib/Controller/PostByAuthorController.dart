import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:kwanho/Models/postList.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import '../Models/post.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PostByAuthorController extends ChangeNotifier{
  List<PostList> postList = [];
  int currentPageNo = 1;
  bool isAdd = false;

  void scrollListener(ScrollUpdateNotification notification){
    if (notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels){
      _morePostsList();
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

  Future<void> statedList() async{
    await _getPostsList();
  }

  Future<void> _getPostsList() async {
    List<PostList>? _data = await _fetchPostList(pageNo: currentPageNo);
    postList = _data;
    currentPageNo = 2;
    print(currentPageNo);
    notifyListeners();
  }

  Future<List<PostList>> _fetchPostList({
    required int pageNo
  }) async {
    try{
      http.Response _response = await http.get(
          Uri.parse("http://203.252.139.208:8000/api/posts/?author=true"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer cc3f30091bec96fd339df5f66f72d3221c2aac10"}
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