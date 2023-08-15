import 'package:flutter/material.dart';

class PostPage extends StatefulWidget{
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage>{

  List<String> _ageType = ['선택','10대','20대','30대','40대','50대~'];
  String _ageDefault = '선택';
  bool _isCheckedAnonymity = false;

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
  Widget build(BuildContext context){
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar( //상단 바
            leading: BackButton(
            onPressed: (){
              _onBackPressed();}
            ),
            title: Text("글쓰기",
            style: TextStyle(fontSize: 30),),
            backgroundColor: const Color(0xffb3e5fc),
      ),
      backgroundColor: const Color(0xffffffff),
          body: Container(
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
                        Align(alignment: Alignment.centerLeft,child: Text("제목"),),
                        TextField()
                      ],
                    ),
                  )
                ), //제목 입력
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text("내용")),
                        TextField()
                      ],
                    ),
                  ),
                ), //내용 입력
                Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Align(alignment: Alignment.centerLeft,child: Text("연령대"),),
                          Container(
                            width: double.infinity,
                            child: DropdownButton<String>(
                              value: _ageDefault,
                              items: _ageType.map((String item) {
                                return DropdownMenuItem<String>(
                                  child: Text("$item"),
                                  value: item,);
                              }).toList(),
                              isExpanded: true,
                              onChanged: (dynamic value){
                                setState(() {
                                  _ageDefault = value;
                                });
                              }),
                          )
                        ],
                      ),
                    )
                ), //연령대
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft,child: Text("태그")),
                        TextField()
                      ],
                    ),
                  ),
                ), //태그
                Padding(padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Checkbox(value: _isCheckedAnonymity, onChanged: (value){
                        setState(() {
                        _isCheckedAnonymity = value!;
                        });
                        }),
                        Align(alignment: Alignment.centerLeft,child: Text("익명"))
                      ],
                    ),
                  ),
                ), //익명
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff007bff)),
                            foregroundColor: Color(0xff007bff)),
                          onPressed: (){},
                        child: Text(
                          '게시',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff007bff),
                          ),
                          softWrap: false,
                        )
                      ),
                    ),
              ],
            ) //게시
          ],
        ),
      ),
    ));
  }
}