import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swadeshi_app/home_screen/home_screen.dart';

import './categories_screen/category_screen.dart';
import 'drawer/info_page.dart';
import 'categories_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          accentColor: Colors.grey,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: 'BalsamiqSans',
                  color: Colors.grey
              ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'BalsamiqSans',
                fontWeight: FontWeight.bold,
                color: Colors.white),
            headline5: TextStyle(
              fontSize: 20,
              fontFamily: 'BalsamiqSans',
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),

          ),
        ),
        home: splashScreen(),
        routes: {
          '/home-screen': (ctx) => HomeScreen(),
          '/category-screen': (ctx) => CategoryScreen(),
          '/info-page': (ctx) => InfoPage()
        });
  }
}
