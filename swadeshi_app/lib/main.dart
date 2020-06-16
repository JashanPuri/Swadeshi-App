import 'package:flutter/material.dart';
import './screens/category_screen.dart';
import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swadeshi App',
      theme: ThemeData(
        // accentColor: Colors.blue,
        textTheme: TextTheme(
          title:TextStyle(
              fontSize: 17,
              fontFamily: 'BalasmiqSans',
              fontWeight: FontWeight.bold
          )
        )
      ),
      home: CategoryScreen(),
    );
  }
}
