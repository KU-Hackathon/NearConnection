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

class PostRequestController {

  Future<dynamic> postRequest(List<dynamic> data) async{

    PostRequest dto = PostRequest(title: data[0], contents: data[1], category: data[2],tags: data[3]);
    print(dto.title);
    print(dto.contents);
    print(dto.category);
    return post(data: dto);
  }

  Future<dynamic> post({required PostRequest data}) async {
    String base_uri = "http://203.252.139.208:8000/api/upload/";
    print(data.toJson());
    try{
      http.Response _response = await http.post(
          Uri.parse(base_uri),
          body: json.encode(data),
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