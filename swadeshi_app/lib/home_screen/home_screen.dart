import 'package:flutter/material.dart';
import 'package:swadeshi_app/drawer/drawer.dart';

import 'package:swadeshi_app/home_screen/search_main_page.dart';

class HomeScreen extends StatefulWidget {
  final Function changeLanguage;
  final bool showInHindi;

  HomeScreen({this.changeLanguage, this.showInHindi});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showInHindi;

  @override
  void initState() {
    super.initState();
    showInHindi = widget.showInHindi;
  }

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
              delegate: SearchProducts(showInHindi),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            value: showInHindi,
            onChanged: (value) {
              setState(() {
                showInHindi = value;
              });
              widget.changeLanguage();
            },
            title: Text(
              'Show in hindi ',
            ),
            secondary: Icon(Icons.language),
          )
        ],
      ),
    );
  }
}
