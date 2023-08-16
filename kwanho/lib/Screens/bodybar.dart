


import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kwanho/Controller/PostAllListController.dart';
import 'package:kwanho/Models/post.dart';
import 'package:kwanho/Models/postList.dart';
import 'package:kwanho/Screens/OpenPost.dart';
import 'package:kwanho/Screens/postAllview.dart';
import 'package:kwanho/Screens/postview.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';

Widget Home(){
    return ListView(
      children: [
        AllView(),
        const SizedBox(height: 5,),
        Views(),
      ],
    );
}

class HotPostView extends StatefulWidget {
  const HotPostView({super.key});

  @override
  _HotPostViewState createState() => _HotPostViewState();
}

class _HotPostViewState extends State<HotPostView> {
  _HotPostViewState();
  PostAllListController postAllListController = PostAllListController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String viewname = "100";
    return ChangeNotifierProvider<PostAllListController>(
    create: (_) => PostAllListController()..statedList(viewname),
    child: Consumer<PostAllListController>(builder: (context,state,child){
      return ListView.builder(
          itemCount: state.postList.length * 2,
          itemBuilder: (context, index) {
            var realIndex = index ~/ 2;
            if (index.isOdd)
              return Divider();
            else
              return ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenPost(postId: state.postList[realIndex].id),)),
                title: TextTitle1(state.postList[realIndex].title),
                subtitle: Column(
                  children: [
                    TEXT1(state.postList[realIndex].contentsPreview, 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TEXT1("Hot 게시판", 16),
                        Row(
                          children: [
                            Icon(Icons.thumb_up,size: 16,),
                            Text("${state.postList[realIndex].likes}",style: TextStyle(fontSize: 14),),
                            SizedBox(width: 5,),
                            Icon(Icons.chat,size: 16),
                            Text("${state.postList[realIndex].comments}",style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
          }
      );
    },),);
  }
}

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  List<ALARM> _alarm = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _alarm.add(new ALARM(title: "와 몬스터가 이제 차가워", Category: "20대", comment: "당연히 차갑지"));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _alarm.length * 2,
        itemBuilder: (context, index) {
          var realIndex = index ~/ 2;
          if (index.isOdd)
            return Divider();
          else
            return ListTile(
              title: TextTitle1(_alarm[realIndex].comment),
              subtitle: TEXT1(_alarm[realIndex].title, 16)
              );
        }
    );
  }
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
  final List<String> _viewnames = ["10", "20", "30", "40", "50"];
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
                          title: Row( children: [
                            (_viewnames[realIndex] != "50")?
                            SizedBox(width: 120,child: TextTitle1("${_viewnames[realIndex]}대 게시판"))
                                :SizedBox(width: 120,child: TextTitle1("${_viewnames[realIndex]}대+ 게시판")),
                            SizedBox(width: 10),
                            Flexible(child: TEXT1("아니 진짜 이게 맞아 ㄹㅇ?dddddddddd??", 16),)
                          ]),
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

class AllView extends StatefulWidget {
  const AllView({super.key});

  @override
  _AllViewState createState() => _AllViewState();
}

class _AllViewState extends State<AllView>{
  PostAllListController postAllListController = PostAllListController();
  _AllViewState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostAllListController>(
      create: (_) => PostAllListController()..statedList(null),
      child: Consumer<PostAllListController>(builder: (context,state,child){
        return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(left: 3, right: 3, top: 10),
                width: double.maxFinite,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
                    child: Text("ALL",
                      style: TextStyle(
                          fontSize: 30, fontFamily: "Aggro", fontWeight: FontWeight.normal),
                    ),),
                    TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PostAllViewPage()));
                  },
                      child: Text("더보기"))
                  ],
                ), // title
                SizedBox(height: 15),
                for (int i = 0; (state.postList.length > 4)? (i<4):(i<state.postList.length); i++)
                  ListTile(
                    title: TEXT1(state.postList[i].title,19),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TEXT1(state.postList[i].contentsPreview, 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [(state.postList[i].category == "100")?
                          Text("Hot 게시판",style: TextStyle(fontSize: 14),)
                              : Text("${state.postList[i].category}대 게시판",style: TextStyle(fontSize: 14),),Row(
                              children: [
                                Icon(Icons.thumb_up,size: 14,),
                                Text("${state.postList[i].likes}   ",style: TextStyle(fontSize: 14),),
                                Icon(Icons.chat,size: 14),
                                Text("${state.postList[i].comments}",style: TextStyle(fontSize: 14)),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPost(postId: state.postList[i].id)));
                    },
                  )
                ],
        )
        ),
        );
      },),
    );

  }

}