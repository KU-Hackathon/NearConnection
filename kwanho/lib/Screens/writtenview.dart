
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kwanho/Controller/PostByAuthorController.dart';
import 'package:provider/provider.dart';

import '../Models/post.dart';
import '../Models/postList.dart';
import '../MyTheme.dart';
import 'OpenPost.dart';
import 'PostPage.dart';

class WrittenView extends StatefulWidget {
  WrittenView();
  @override
  State<WrittenView> createState() => _WrittenViewState();
}

class _WrittenViewState extends State<WrittenView> {
  _WrittenViewState();
  PostByAuthorController postByAuthorController = PostByAuthorController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostByAuthorController>(
      create: (_) => PostByAuthorController()..statedList(),
      child: Consumer<PostByAuthorController>(builder: (context,state,child){
        return Scaffold(
          appBar: AppBar(title: Text("모든 글"),),
          body: NotificationListener<ScrollUpdateNotification>(
            onNotification: (ScrollUpdateNotification notification){
              state.scrollListener(notification);
              return false;
            },
            child: ListView.builder(
              itemCount:  state.postList.length*2,
              itemBuilder: (context, index){
                var realIndex = index ~/ 2;
                if(index.isOdd) return Divider();
                else {
                  return ListTile(
                  title: TextTitle1(state.postList[realIndex].title),
                  subtitle: Column(children: [
                    TEXT1(state.postList[realIndex].contentsPreview, 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.thumb_up,size: 14,),
                        Text("${state.postList[realIndex].likes}",style: TextStyle(fontSize: 14),),
                        Icon(Icons.chat,size: 14),
                        Text("${state.postList[realIndex].comments}",style: TextStyle(fontSize: 14)),
                      ],
                    )
                  ],),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OpenPost(postId: state.postList[realIndex].id)));
                  },
                );
                }
              },),
          ),
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightBlueAccent,onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage())),child: Icon(Icons.mode)),
        );
      },),);
  }
}

