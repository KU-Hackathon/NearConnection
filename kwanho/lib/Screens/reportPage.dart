import 'package:flutter/material.dart';
import 'package:kwanho/Screens/OpenPost.dart';

import '../Models/post.dart';


class ReportPage extends StatefulWidget{
  final Post post;
  ReportPage({required this.post});
  @override
  State<ReportPage> createState() => _ReportPageState(post);
}


class _ReportPageState extends State<ReportPage> {
  List<String> _reportType = ['선택','욕설','비방','음란','허위','기타'];
  String _reportDefault = '선택';
  Post _post;
  _ReportPageState(this._post);
  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("나가면 지금까지 작성한 내용은 사라집니다."),
            actions: <Widget>[
              TextButton(onPressed: () {Navigator.pop(context,true);},
                child: Text("나가기"),),
              ElevatedButton(onPressed: () {Navigator.pop(context,false);},
                child: Text("취소"),)
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
        appBar: AppBar( //상단 바
          leading: BackButton(
              onPressed: (){
                _onBackPressed();}
          ),
          title: Text("신고 - ${_post.title}",
            style: TextStyle(fontFamily: 'Aggro',fontSize: 30),),
          backgroundColor: const Color(0xffb3e5fc),
        ),
        backgroundColor: const Color(0xffffffff),
        body:Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text("신고 사유"),),
                        Container(
                            width: double.infinity,
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                  value: _reportDefault,
                                  items: _reportType.map((String item) {
                                    return DropdownMenuItem<String>(
                                      child: Text("$item"),
                                      value: item,);
                                  }).toList(),
                                  isExpanded: true,
                                  onChanged: (dynamic value){
                                    setState(() {
                                      _reportDefault = value;
                                    });
                                  }),))
                      ],
                    ),
                  )), //신고 사유
              Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10), //신고 내용
                child: SizedBox(
                  child: Column(
                    children: [
                      Align(alignment: Alignment.centerLeft,child: Text("신고 내용")),
                      TextField()
                    ],
                  ),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xffdc3545)),
                            foregroundColor: Color(0xffdc3545)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPost(post: _post)));
                        },
                        child: Text(
                          '신고',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xffdc3545),
                          ),
                          softWrap: false,
                        )),),
                ],
              )
            ],
          ),
        )
    ));
  }
}
