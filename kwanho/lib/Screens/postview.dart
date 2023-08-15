import 'package:flutter/material.dart';
import 'package:kwanho/Screens/OpenPost.dart';

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
  List<Post> _posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _posts.add(new Post(likes: 10, chats: 20, contents: "contents", title: "title"));
  }

  _PostViewPageState({required this.viewname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$viewname 게시판"),),
      body: ListView.builder(itemCount:_posts.length*2,itemBuilder: (context, index){
        var realIndex = index ~/ 2;
        if(index.isOdd) return Divider();
        else return ListTile( title: TextTitle1("${_posts[realIndex].title}"),
          subtitle: Column(children: [
            TEXT1("${_posts[realIndex].contents}", 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.thumb_up,size: 14,),
                Text("${_posts[realIndex].likes}",style: TextStyle(fontSize: 14),),
                Icon(Icons.chat,size: 14),
                Text("${_posts[realIndex].chats}",style: TextStyle(fontSize: 14)),
              ],
            )
          ],),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OpenPost(post: _posts[realIndex])));
          },
        );
      },),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightBlueAccent,onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage())),child: Icon(Icons.mode)),
    );
  }
}
