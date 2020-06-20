import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home_screen/category_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.06),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Swadeshi App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        // accentColor: Colors.blue,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'BalsamiqSans',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 20,
            fontFamily: 'BalsamiqSans',
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      home: CategoryScreen(),
    );
  }
}
