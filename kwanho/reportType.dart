import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class reportType extends StatelessWidget {
  //reportType({ Key key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(size: 68.0, start: 0.5),
          Pin(size: 21.0, start: 0.0),
          child: Text(
            '신고 사유',
            style: TextStyle(
              fontFamily: 'HelveticaNeue',
              fontSize: 16,
              color: const Color(0xff212529),
              height: 1.5,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Container(),
      ],
    );
  }
}
