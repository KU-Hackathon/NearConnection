


import 'package:flutter/material.dart';
import 'package:kwanho/Models/post.dart';
import 'package:kwanho/Models/postList.dart';
import 'package:kwanho/Models/user.dart';
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
  State<HotPostView> createState() => _HotPostViewState();
}

class _HotPostViewState extends State<HotPostView> {
  List<PostList> _HotPosts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _HotPosts.length * 2,
        itemBuilder: (context, index) {
          var realIndex = index ~/ 2;
          if (index.isOdd)
            return Divider();
          else
            return ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenPost(postId: _HotPosts[realIndex].id),)),
              title: TextTitle1(_HotPosts[realIndex].title),
              subtitle: Column(
                children: [
                  TEXT1(_HotPosts[realIndex].contentsPreview, 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TEXT1(_HotPosts[realIndex].category+" 게시판", 16),
                      Row(
                        children: [
                          Icon(Icons.thumb_up,size: 16,),
                          Text("${_HotPosts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                          SizedBox(width: 5,),
                          Icon(Icons.chat,size: 16),
                          Text("${_HotPosts[realIndex].comments}",style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
      }
    );
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
              Text("${Provider.of<USER>(context,listen: true).token}"),
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
                          title: Row( children: [ SizedBox(width: 120,child: TextTitle1("${_viewnames[realIndex]} 게시판")),SizedBox(width: 10),Flexible(child: TEXT1("아니 진짜 이게 맞아 ㄹㅇ?dddddddddd??", 16),)]),
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
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView>{
  @override
  final List<Post> _Posts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Frame(Text(
      "ALL",
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
              Row(
                children: [
                  t,
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PostAllViewPage()));
                  },
                      child: Text("더보기"))
                ],
              ), // title
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _Posts.length * 2,
                    itemBuilder: (context, index) {
                      var realIndex = index ~/ 2;
                      if (index.isOdd)
                        return Divider();
                      else
                        return ListTile(
                          title: TextTitle1("${_Posts[realIndex].title}"),
                          subtitle: Column(
                            children: [
                              TEXT1(_Posts[realIndex].contents, 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${_Posts[realIndex].category} 게시판",textAlign: TextAlign.start,style: TextStyle(fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.thumb_up,size: 16,),
                                      Text("${_Posts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                                      SizedBox(width: 5,),
                                      Icon(Icons.chat,size: 16),
                                      Text("${_Posts[realIndex].comments}",style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostViewPage(viewname: _Posts[realIndex].category)));
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