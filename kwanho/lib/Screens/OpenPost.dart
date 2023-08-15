import 'package:flutter/material.dart';
import '../Models/post.dart';
import 'reportPage.dart';
import 'package:flutter/services.dart';

class OpenPost extends StatefulWidget{
  final Post post;
  OpenPost({required this.post});

  @override
  _OpenPostState createState() => _OpenPostState(post);
}

class _OpenPostState extends State<OpenPost> {
  final Post _post;
  _OpenPostState(this._post);

  List<bool> _beforeLikeSelected = [false];
  List<bool> _likeSelected = [false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( //상단 바
          title: Text("게시판 종류",
            style: TextStyle(fontFamily: 'Aggro',fontSize: 30),),
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
                                    child: Text("${_post.title}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text("작성자 - 나이대",
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
                                child: Text("${_post.contents}",
                                  textAlign: TextAlign.left,
                                  softWrap: true,),),
                            ),//본문 내용
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,//좋아요, 신고 버튼 박스
                                children: [
                                  ToggleButtons(
                                      onPressed: (int index){
                                        setState(() {
                                          _likeSelected[index] = !_likeSelected[index];
                                        });
                                      },
                                      selectedBorderColor: Color(0xff007bff),
                                      selectedColor: Colors.white,
                                      color: Color(0xff007bff),
                                      isSelected: _likeSelected,
                                      constraints: const BoxConstraints(
                                          minHeight: 30,
                                          minWidth: 60
                                      ),
                                      children: const [
                                        Text(
                                          '좋아요',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff007bff),
                                          ),
                                          softWrap: false,
                                        )]
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xffdc3545)),
                                          foregroundColor: Color(0xffdc3545)),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(post: _post,)));
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
                    Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.black, width: 1))
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
                          child: Align(alignment: Alignment.centerLeft,
                            child: Text("댓글",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff707070),
                                )
                            ),
                          ),
                        )

                    ),
                    Padding(//세부 댓글
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
                    ),
                    Padding(
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
                              )
                          )
                      ),
                    ),
                    Padding(
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
                              )
                          )
                      ),
                    ), //댓글
                  ]
              )
            ]
        )
    );
  }
}


