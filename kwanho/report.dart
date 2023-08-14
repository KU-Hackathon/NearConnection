import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class report extends StatelessWidget {
  //report({ Key key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1.0, color: const Color(0xffdc3545)),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 32.0, end: 7.0),
          Pin(size: 21.0, middle: 0.4545),
          child: Text(
            '신고',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 16,
              color: const Color(0xffdc3545),
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
