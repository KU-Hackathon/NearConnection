import 'package:flutter/material.dart';
import 'package:kwanho/Controller/PostAllListController.dart';
import 'package:kwanho/Screens/OpenPost.dart';
import 'package:provider/provider.dart';

import '../Models/post.dart';
import '../MyTheme.dart';
import 'PostPage.dart';



class PostViewPage extends StatefulWidget {
  final String viewname;
  PostViewPage({required this.viewname});

  @override
  State<PostViewPage> createState() => _PostViewPageState(viewname: this.viewname);
}

class _PostViewPageState extends State<PostViewPage> {
  final String viewname;
  PostAllListController postController = PostAllListController();
  List<Post> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _PostViewPageState({required this.viewname});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostAllListController>(
        create: (_) => PostAllListController()..statedList(),
        child: Consumer<PostAllListController>(builder: (context,state,child){
          return Scaffold(
            appBar: AppBar(title: Text("$viewname 게시판"),),
            body: NotificationListener<ScrollUpdateNotification>(
              onNotification: (ScrollUpdateNotification notification){
                state.scrollListener(notification);
                return false;
              },
              child: ListView.builder(
                itemCount:posts.length*2,
                itemBuilder: (context, index){
                  var realIndex = index ~/ 2;
                  if(index.isOdd) return Divider();
                  else return ListTile( title: TextTitle1("${posts[realIndex].title}"),
                    subtitle: Column(children: [
                      TEXT1("${posts[realIndex].contents}", 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.thumb_up,size: 14,),
                          Text("${posts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                          Icon(Icons.chat,size: 14),
                          Text("${posts[realIndex].comments}",style: TextStyle(fontSize: 14)),
                        ],
                      )
                    ],),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OpenPost(postId: posts[realIndex].id)));
                    },
                  );
                },),
            ),
            floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightBlueAccent,onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage())),child: Icon(Icons.mode)),
          );
        },),);
  }
}
