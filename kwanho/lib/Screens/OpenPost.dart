import 'package:flutter/material.dart';
import 'package:kwanho/Controller/CommentRequestController.dart';
import 'package:kwanho/Controller/PostController.dart';
import 'package:kwanho/Models/postList.dart';
import 'package:kwanho/MyTheme.dart';
import 'package:provider/provider.dart';
import '../Models/post.dart';
import 'reportPage.dart';
import '../Models/comment.dart';
import 'PostComment.dart';
import 'package:flutter/services.dart';

class OpenPost extends StatefulWidget{
  final int postId;
  OpenPost({required this.postId});

  @override
  _OpenPostState createState() => _OpenPostState(postId);
}

class _OpenPostState extends State<OpenPost> {
  int postId;
  TextEditingController controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final PostController _postController = PostController();
  _OpenPostState(this.postId);
  List<Comment> _comment = [];
  List<bool> _beforeLikeSelected = [false];
  List<bool> _likeSelected = [false];
  bool _isCheckedAnonymity = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllForContent = TextEditingController();

  CommentRequestController commentRequestController = CommentRequestController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostController>(
        create: (_) => PostController()..stated(postId: postId),
    child: Consumer<PostController>(builder: (context,state,child) {
      return  Scaffold(
        appBar: AppBar( //상단 바
          title: Text("${state.post.category}",
            style: TextStyle(fontFamily: 'Pretendard',fontSize: 20),),
          backgroundColor: Color(0xffb3e5fc),
        ),
        backgroundColor: Color(0xffffffff),
        body:
        ListView(
          padding: EdgeInsets.all(5),
          children: [
            Column(
                children: [
                  Container(
                      constraints: BoxConstraints(
                          minHeight: 150
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Colors.black,width: 0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                            bottomLeft: Radius.circular(4.0),
                            bottomRight: Radius.circular(4.0)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,//글 제목, 작성자 박스
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Text("${state.post.title}",softWrap: true,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Text("${state.post.author} - ${state.post.author_age}대",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff6c757d),
                                    ),
                                    textAlign: TextAlign.right,
                                    softWrap: false,),
                                )
                              ],
                            ),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${state.post.contents}",
                                textAlign: TextAlign.left,
                                softWrap: true,),),
                          ),//본문 내용
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,//좋아요, 신고 버튼 박스
                              children: [
                                OutlinedButton(
                                    onPressed: (){

                                    },
                                    style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xff007bff)),
                                    foregroundColor: Color(0xff007bff)),
                                    child: const
                                      Text(
                                        '좋아요',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff007bff),
                                        ),
                                        softWrap: false,
                                      )
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Color(0xffdc3545)),
                                        foregroundColor: Color(0xffdc3545)),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(post: state.post)));
                                    },
                                    child: Text(
                                      '신고',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: const Color(0xffdc3545),
                                      ),
                                      softWrap: false,
                                    )),
                              ],
                            ),)
                        ],
                      )
                  ),
                  //댓글
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
                    child: Align(alignment: Alignment.centerLeft,
                      child: Text("댓글",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff707070),
                          )
                      ),
                    ),
                  ),
                  for (int i = 0; i < (state.post.comments.length); i++)
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Text("${state.post.comments[i]["content"]}",
                            style: TextStyle(fontSize: 15),),
                          Text("${state.post.comments[i]["author"]} - ${state.post.comments[i]["author_age"]}대",
                            style: TextStyle(fontSize: 12),)],),)
                  //댓글
                ]
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          child:
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: _isCheckedAnonymity, onChanged: (value){
                  setState(() {
                    _isCheckedAnonymity = value!;
                  });
                }),
                Align(alignment: Alignment.centerLeft,child: Text("익명")),
                Flexible(
                    child: Padding(padding: EdgeInsets.fromLTRB(1, 6, 1, 6),
                      child: TextFormField(
                        controller: controllForContent,
                        decoration: InputDecoration(
                          hintText: '댓글',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),),
                        ),
                      ),)),
                Padding(padding: EdgeInsets.fromLTRB(1, 6, 1, 10),
                  child: TextButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          commentRequestController.commentRequest([state.post.id,controllForContent.text]);
                          controllForContent.text = "";
                        }
                      },
                      child: Text(
                        '등록',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xffdc3545),
                        ),
                        softWrap: false,
                      )),),
              ],
            ),
          )
        )
      );
    }),);
  }
}

/*Padding(//세부 댓글
                      padding: EdgeInsets.fromLTRB(1, 5.5, 5.5, 1),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black, width: 0.5))
                          ),
                          width: double.infinity,
                          child: Align(alignment: Alignment.centerLeft,
                            child: Column(
                              children: const [
                                Text("댓글 내용",softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                      height: 1.5,
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 1, 1, 3),
                                  child: Text("작성자 - 나이대",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff6c757d),
                                    ),),)
                              ],
                            ),
                          )
                      ),
                    )*/


