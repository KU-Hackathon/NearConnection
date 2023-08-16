


import 'package:flutter/material.dart';
import 'package:kwanho/Models/post.dart';
import 'package:kwanho/Screens/OpenPost.dart';
import 'package:kwanho/Screens/postview.dart';

import '../MyTheme.dart';

Widget Home(){
    return ListView(
      children: [
        const SizedBox(height: 5,),
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
  List<Post> _HotPosts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _HotPosts.add(new Post(Catogory: '10대', contents: "와 진짜 실화냐", title: "몬스터가 안차가워"));
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenPost(post: _HotPosts[realIndex]),)),
              title: TextTitle1(_HotPosts[realIndex].title),
              subtitle: Column(
                children: [
                  TEXT1(_HotPosts[realIndex].contents, 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TEXT1(_HotPosts[realIndex].Catogory+" 게시판", 16),
                      Row(
                        children: [
                          Icon(Icons.thumb_up,size: 16,),
                          Text("${_HotPosts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                          SizedBox(width: 5,),
                          Icon(Icons.chat,size: 16),
                          Text("${_HotPosts[realIndex].chats}",style: TextStyle(fontSize: 14)),
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
    _alarm.add(new ALARM(title: "와 몬스터가 이제 차가워", Catogory: "20대", comment: "당연히 차갑지"));
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
    //get _Posts
    _Posts.add(new Post(Catogory: '10대', contents: "Contents", title: "title"));
    _Posts.add(new Post(Catogory: '20대', contents: "Contents", title: "title"));
    _Posts.add(new Post(Catogory: '30대', contents: "Contents", title: "title"));
    _Posts.add(new Post(Catogory: '40대', contents: "Contents", title: "title"));
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
              t, // title
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
                                  Text("${_Posts[realIndex].Catogory} 게시판",textAlign: TextAlign.start,style: TextStyle(fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.thumb_up,size: 16,),
                                      Text("${_Posts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                                      SizedBox(width: 5,),
                                      Icon(Icons.chat,size: 16),
                                      Text("${_Posts[realIndex].chats}",style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostViewPage(viewname: _Posts[realIndex].Catogory)));
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