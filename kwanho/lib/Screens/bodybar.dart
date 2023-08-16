

import 'package:flutter/material.dart';
import 'package:kwanho/Screens/postview.dart';

import '../MyTheme.dart';

Widget Home(){
    return ListView(
      children: [
        SizedBox(height: 20,),
        Views(),
      ],
    );;
}

Widget HotPostView() {
    return Container(child: Text("HOt"),);
}
Widget Alarm() {
    return Container(child: Text("Alarm"),);
}
Widget Setting() {
    return Container(child: Text("Setting"),);
}


class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  final List<String> _viewnames = ["10대", "20대", "30대", "40대", "50+"];

  Widget build(BuildContext context) {
    return Frame(Text(
      "게시판",
      style: TextStyle(
          fontSize: 30, fontFamily: "Aggro", fontWeight: FontWeight.normal),
    ));
  }

  Widget Frame(Text t) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          width: double.maxFinite,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              t, // title
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _viewnames.length * 2,
                    itemBuilder: (context, index) {
                      var realIndex = index ~/ 2;
                      if (index.isOdd)
                        return Divider();
                      else
                        return ListTile(
                          title: Row( children: [ SizedBox(width: 120,child: TextTitle1("${_viewnames[realIndex]} 게시판")),SizedBox(width: 10),SizedBox(width: 230,child: TEXT1("아니 진짜 이게 맞아 ㄹㅇ?dddddddddd??", 16),)]),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostViewPage(viewname: _viewnames[realIndex])));
                          },
                        );
                    },
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}