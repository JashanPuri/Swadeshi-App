import 'dart:async';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacementNamed('/category-screen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          crossFadeState: CrossFadeState.showSecond,
          duration: Duration(seconds: 2),
          firstChild: Image.asset('assets/other_images/make_in_india.png',height: 512,width: 284,),
          secondChild: Image.asset('assets/other_images/vocal_for_local.png',),
          //sizeCurve: Curves.easeInOutQuad,
        ),
      )
    );
  }
}
