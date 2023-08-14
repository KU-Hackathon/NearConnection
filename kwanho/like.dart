import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class like extends StatelessWidget {
  //like({Key key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1.0, color: const Color(0xff007bff)),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 48.0, end: 10.0),
          Pin(size: 21.0, middle: 0.4615),
          child: Text(
            '좋아요',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 16,
              color: const Color(0xff007bff),
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
