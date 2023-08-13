import 'package:flutter/material.dart';
import 'package:kwanho/Models/views.dart';
import '../MyTheme.dart';
import 'bottom.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text(
          "니어커넥션",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          HotView(),
          Views(),
        ],
      ),
      bottomNavigationBar: Bottom(),
    );
  }
}

class HotView extends StatefulWidget {
  
  @override
  State<HotView> createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  final List<HOT> Contents = [];

  void initState(){
    super.initState();
    // info
    for(int i=0;i<5;i++){
      //null not add
      //else Contents.add()
    }
    Contents.add(new HOT(kind: "10대",thumbs: 27,Title: "그대라는 사치",Index: 32,Content: "ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라"));
    Contents.add(new HOT(kind: "10대",thumbs: 27,Title: "그대라는 사치",Index: 32,Content: "ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라"));
    Contents.add(new HOT(kind: "10대",thumbs: 27,Title: "그대라는 사치",Index: 32,Content: "ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라ㅇ라ㅇ라라"));
  }

  Widget build(BuildContext context) {
    return Frame(
      Text("Hot 게시판",
          style: TextStyle(
              fontSize: 30,
              fontFamily: "Aggro",
              fontWeight: FontWeight.normal)),
    );
  }

  Widget Frame(Text t) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right:10.0,bottom: 5),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          width: double.maxFinite,
          height: 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              t,
              SizedBox(
                height: 15,
              ),
              BuildList(),
            ],
          )),
    );
  }

  Widget BuildList(){
    return Expanded(
      child: Container(child: ListView.builder(
        itemCount: Contents.length*2,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var realIndex = index ~/ 2;
          if (index.isOdd)
            return Divider();
          else
            return ListTile(
              title: TextTitle1(
                "${Contents[realIndex].Title}"),
              subtitle: Column(
                children: [
                  SizedBox(width: double.maxFinite,child: Text("${Contents[realIndex].Content}",maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start, style: TextStyle(color: Colors.black),))
                  ,Row(
                    children: [
                      Text("${Contents[realIndex].kind} 게시판"),
                      SizedBox(width: 260,),
                      Icon(Icons.thumb_up,color: Colors.redAccent,size: 20),
                      SizedBox(width: 10,),
                      Text("${Contents[realIndex].thumbs}"),
                    ],
                  ),

                ],
              )
            );
        },
      )),
    );
  }
}

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  final List<String> _viewnames = ["10대", "20대", "30대", "40대", "40+"];

  Widget build(BuildContext context) {
    return Frame(Text(
      "게시판",
      style: TextStyle(
          fontSize: 30, fontFamily: "Aggro", fontWeight: FontWeight.normal),
    ));
  }

  Widget Frame(Text t) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right:10.0),
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
              t,
              SizedBox(
                height: 15,
              ),
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
                              title: Row(
                                children: [
                                  SizedBox(width: 120,child: TextTitle1("${_viewnames[realIndex]} 게시판")),
                                  SizedBox(width: 10,),
                                  SizedBox(width: 230,child: TEXT1("아니 진짜 이게 맞아 ㄹㅇ?dddddddddd??", 16))
                                ],
                              ),onTap: (){
                                Navigator.pushNamed(context, '/PostView');
                            },
                            );
                        }
                        )
                ),
              ),
            ],
          )
      ),
    );
  }
}
