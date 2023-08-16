import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kwanho/Models/CommentRequest.dart';
import 'package:kwanho/Models/PostRequest.dart';
import '../Models/post.dart';
import 'package:logger/logger.dart';
import '../Models/Token.dart';


var logger = Logger(
  printer: PrettyPrinter(),
);

class CommentRequestController {
  Token token = Token();

  Future<dynamic> commentRequest(List<dynamic> data) async{

    CommentRequest dto = CommentRequest(postId: data[0], contents: data[1]);
    print(dto.postId);
    print(dto.contents);
    return postComment(data: dto);
  }

  Future<dynamic> postComment({required CommentRequest data}) async {
    String base_uri = "http://203.252.139.208:8000/api/comments/${data.postId}/?content=${data.contents}";
    print(data.toJson());
    try{
      http.Response _response = await http.post(
          Uri.parse(base_uri),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token.token
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