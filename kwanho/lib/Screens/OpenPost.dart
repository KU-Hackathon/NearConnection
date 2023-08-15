import 'package:flutter/material.dart';

import '../Models/post.dart';


class OpenPost extends StatelessWidget {
  OpenPost({required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post.title}"),
      ),
    );
  }
}
