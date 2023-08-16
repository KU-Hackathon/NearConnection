
import 'package:flutter/material.dart';

class PostComment extends StatefulWidget{

  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {

  bool _isCheckedAnonymity = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: _isCheckedAnonymity, onChanged: (value){
            setState(() {
              _isCheckedAnonymity = value!;
            });
          }),
          Align(alignment: Alignment.centerLeft,child: Text("익명")),
          const Flexible(
              child: Padding(padding: EdgeInsets.fromLTRB(1, 6, 1, 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '댓글',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),),
                  ),
                ),)),
          Padding(padding: EdgeInsets.fromLTRB(1, 6, 1, 10),
            child: TextButton(
                onPressed: (){},
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
    );
  }
}
