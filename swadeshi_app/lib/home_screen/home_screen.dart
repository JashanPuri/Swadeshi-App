import 'package:flutter/material.dart';
import 'package:swadeshi_app/drawer/drawer.dart';
import 'package:swadeshi_app/home_screen/search_main_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swadeshi'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchProducts(),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
