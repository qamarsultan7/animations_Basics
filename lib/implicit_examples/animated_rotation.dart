import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedRotations extends StatefulWidget {
  const AnimatedRotations({Key? key}) : super(key: key);

  @override
  _AnimatedRotationsState createState() => _AnimatedRotationsState();
}

class _AnimatedRotationsState extends State<AnimatedRotations> {
  @override
  Alignment alignm=Alignment.topCenter;
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
         alignm=Alignment.bottomCenter;
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation'),
      ),
      body: Center(
          child: AnimatedAlign(
              alignment: alignm,
              curve: Curves.linear,
              duration:const  Duration(seconds: 2),
              child:const  FlutterLogo(
                size: 50,
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            
          });
        },
        child: const Icon(Icons.replay),
      ),
    );
  }
}
