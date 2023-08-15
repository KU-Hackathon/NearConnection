
import 'package:flutter/material.dart';
import 'package:test1/OpenPost.dart';

class reportPage extends StatefulWidget{
  const reportPage({Key? key}) : super(key: key);

  @override
  State<reportPage> createState() => _reportPageState();
}


class _reportPageState extends State<reportPage> {
  List<String> _reportType = ['선택','욕설','비방','음란','허위','기타'];
  String _reportDefault = '선택';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Aggro'),
      home: Scaffold(
        appBar: AppBar( //상단 바
          leading: BackButton(),
          title: Text("신고 - 게시물 제목",
            style: TextStyle(fontFamily: 'Aggro',fontSize: 30),),
          backgroundColor: const Color(0xffb3e5fc),
        ),
        backgroundColor: const Color(0xffffffff),
        body:Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),),
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
                          }),)
                    ],
                  ),
                )),
              Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPost()));
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
      ),
    );
  }
}
