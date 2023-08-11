
import 'package:flutter/material.dart';

import 'bottom.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("니어커넥션"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),

      body: ListView(
        children: [

        ],
      ),
      bottomNavigationBar: Bottom(),
    );
  }
}
class View extends StatelessWidget {
  final String Title;
  View(this.Title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration( border: Border.all(width: 3, color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(width:double.maxFinite,child: Text("       $Title 게시판",textAlign: TextAlign.left,),),
                ),
                TextButton(onPressed: (){}, child: Text("알랄랄라ㅏㄹ라랄"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      color: Colors.red,
    );
  }
}