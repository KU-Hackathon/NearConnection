import 'package:flutter/material.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Container> conlist = [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: conlist.length,
          pageSnapping: true,
          itemBuilder: (context, index) {
            if(index==conlist.length){
              for(int i = conlist.length;i<10;i++){
                conlist.add(Container(child: Text("$i",textScaleFactor: 10,),));
              }
            }
          return Center(child: conlist[index]);
        },),
        bottomNavigationBar: BottomAppBar(
          height: 40,
          child: const BottomSheetExample(),
        ),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
