import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kwanho/Models/PostRequest.dart';
import '../Models/post.dart';
import 'package:logger/logger.dart';
import '../Models/Token.dart';


var logger = Logger(
  printer: PrettyPrinter(),
);

class LikeRequestController {

  Future<dynamic> likeRequest(int postId) async{
    return post(postId: postId);
  }

  Future<dynamic> post({required int postId}) async {
    String base_uri = "http://203.252.139.208:8000/api/like/$postId/";
    try{
      http.Response _response = await http.post(
          Uri.parse(base_uri),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          }
      );
      if(_response.statusCode == 201){
        return _response.statusCode;
      }
      else{
        return null;
      }
    }catch(error, trace){
      logger.e(error);
      logger.e(trace);
      return null;
    }
  }
}