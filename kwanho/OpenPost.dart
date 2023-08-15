import 'package:flutter/material.dart';
import 'reportPage.dart';


class OpenPost extends StatelessWidget {
  //OpenPost({Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Aggro'),
        home: Scaffold(
          appBar: AppBar( //상단 바
            leading: BackButton(),
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
                          child: Expanded(
                            child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,//글 제목, 작성자 박스
                                children: const [
                                  SizedBox(
                                    height: 50,
                                    child: Text("글 제목",
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
                                  child: Expanded(
                                    child: Text("Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                                      textAlign: TextAlign.left,
                                      softWrap: true,),
                                  ),),
                              ),//본문 내용
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,//좋아요, 신고 버튼 박스
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xff007bff)),
                                            foregroundColor: Color(0xff007bff)),
                                          onPressed: (){},
                                          child: Text(
                                        '좋아요',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff007bff),
                                        ),
                                        softWrap: false,
                                      )),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Color(0xffdc3545)),
                                            foregroundColor: Color(0xffdc3545)),
                                          onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => reportPage()));
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
                          ),)
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
                              child: Expanded(
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
                                  )),
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
                              child: Expanded(
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
                                  )),
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
                              child: Expanded(
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
                                  )),
                            )
                        ),
                      ), //댓글
                    ]
                )
              ]
          )
          )
    );
  }
}
      /*Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 432.0, start: 57.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 346.0, end: 91.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 44.0, 0.0, 0.0),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 58.0, end: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffced4da)),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 22.5, end: 22.5),
                                    Pin(size: 44.0, end: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 23.0,
                                          child: SizedBox.expand(
                                              child: Text(
                                            '댓글 내용 Lorem  ',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              height: 1.5,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                          child: Pinned.fromPins(
                                            Pin(size: 83.0, start: 3.5),
                                            Pin(),
                                            child: Text(
                                              '작성자 - 나이대',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: const Color(0xff6c757d),
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 58.0, middle: 0.75),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffced4da)),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 22.5, end: 22.5),
                                    Pin(size: 44.0, end: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 23.0,
                                          child: SizedBox.expand(
                                              child: Text(
                                            '댓글 내용 Lorem  ',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              height: 1.5,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                          child: Pinned.fromPins(
                                            Pin(size: 83.0, start: 3.5),
                                            Pin(),
                                            child: Text(
                                              '작성자 - 나이대',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: const Color(0xff6c757d),
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 58.0, middle: 0.5),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffced4da)),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 22.5, end: 22.5),
                                    Pin(size: 44.0, end: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 23.0,
                                          child: SizedBox.expand(
                                              child: Text(
                                            '댓글 내용 Lorem  ',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              height: 1.5,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                          child: Pinned.fromPins(
                                            Pin(size: 83.0, start: 3.5),
                                            Pin(),
                                            child: Text(
                                              '작성자 - 나이대',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: const Color(0xff6c757d),
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 58.0, middle: 0.25),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffced4da)),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 22.5, end: 22.5),
                                    Pin(size: 44.0, end: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 23.0,
                                          child: SizedBox.expand(
                                              child: Text(
                                            '댓글 내용 Lorem  ',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              height: 1.5,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                          child: Pinned.fromPins(
                                            Pin(size: 83.0, start: 3.5),
                                            Pin(),
                                            child: Text(
                                              '작성자 - 나이대',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: const Color(0xff6c757d),
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 58.0, start: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffced4da)),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 22.5, end: 22.5),
                                    Pin(size: 44.0, end: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 23.0,
                                          child: SizedBox.expand(
                                              child: Text(
                                            '댓글 내용 Lorem  ',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              height: 1.5,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                          child: Pinned.fromPins(
                                            Pin(size: 83.0, start: 3.5),
                                            Pin(),
                                            child: Text(
                                              '작성자 - 나이대',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 12,
                                                color: const Color(0xff6c757d),
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 44.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, start: 22.0),
            Pin(size: 27.0, middle: 0.5539),
            child: Text(
              '댓글',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff707070),
              ),
              softWrap: false,
            ),
          ),

          Pinned.fromPins(
            Pin(start: 5.0, end: 5.0),
            Pin(size: 419.0, start: 64.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    border:
                        Border.all(width: 1.5, color: const Color(0xff000000)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 51.0, 10.0, 39.0),
                  child: SizedBox.expand(
                      child: Text(
                    'Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      height: 1.5,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                  )),
                ),
                Pinned.fromPins(
                  Pin(start: 10.0, end: 10.0),
                  Pin(size: 27.0, start: 13.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Text(
                          '글 제목',
                          style: TextStyle(
                            fontFamily: 'HCR Dotum Ext',
                            fontSize: 20,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 90.0,
                          height: 17.0,
                          child: Text(
                            '작성자 - 나이대',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 13,
                              color: const Color(0xff6c757d),
                            ),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 69.0, start: 9.0),
                  Pin(size: 34.0, end: 5.0),
                  child: like(),
                ),
                Pinned.fromPins(
                  Pin(size: 47.0, end: 8.0),
                  Pin(size: 32.0, end: 7.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => ReportPage(),
                      ),
                    ],
                    child: report(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),*/

