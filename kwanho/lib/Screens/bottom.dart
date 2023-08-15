
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/MyPage'), icon: Icon(Icons.person)),
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/PostView'), icon: Icon(Icons.person)),
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/Login'), icon: Icon(Icons.person)),
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/PostView/OpenPost'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
