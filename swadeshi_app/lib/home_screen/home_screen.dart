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
    final height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: height*0.3,
                width: width*0.75,
                child: Image.asset('assets/other_images/search_icon.jpg',fit: BoxFit.fill,),
            ),
          ),
          Text(
            'Search For Products here !!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontFamily: 'BalsamiqSans'
            ),
          )
        ],
      ),
    );
  }
}
