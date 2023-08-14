import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './like.dart';
import './report.dart';
import './ReportPage.dart';
import 'package:adobe_xd/page_link.dart';

class OpenPost extends StatelessWidget {
  //MainPage({Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
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
            Pin(start: 0.0, end: 0.0),
            Pin(size: 57.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffb3e5fc),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 79.0, start: 62.0),
                  Pin(size: 20.0, middle: 0.5135),
                  child: Text(
                    '게시판 종류',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 15,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                ),
                Container(),
              ],
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
      ),
    );
  }
}
