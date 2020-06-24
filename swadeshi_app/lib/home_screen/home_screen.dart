import 'package:flutter/material.dart';

import '../drawer/drawer.dart';
import '../home_screen/search_main_page.dart';

class HomeScreen extends StatefulWidget {
  final Function changeLanguage;
  final bool showInHindi;

  HomeScreen({this.changeLanguage, this.showInHindi});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool showInHindi = widget.showInHindi;
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
              delegate: SearchProducts(showInHindi),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(
        showInHindi: showInHindi,
        changeLanguage: widget.changeLanguage,
        showSwitch: true,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
