
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class WritePage extends StatelessWidget {
  final String viewname;
  WritePage(this.viewname);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("글쓰기"),
        actions: [FilledButton(onPressed: (){}, child: const Text("완료"))],
      ),
      body: Column(
        children: [
          Text("$viewname 게시판"),

        ],
      ),


    );
  }
}
