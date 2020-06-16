import 'package:flutter/material.dart';
import './home_screen/category_screen.dart';
import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swadeshi App',
      theme: ThemeData(
        // accentColor: Colors.blue,
        textTheme: TextTheme(
          headline6:TextStyle(
              fontSize: 20,
              fontFamily: 'BalsamiqSans',
              fontWeight: FontWeight.bold,
              color: Colors.white
          )
        )
      ),
      home: CategoryScreen(),
    );
  }
}
