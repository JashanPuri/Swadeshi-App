import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import '../drawer/drawer.dart';
import '../home_screen/search_main_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<bool> _backPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
              'Do you really want to exit the app ?',
          style: Theme.of(context).textTheme.headline1,
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 20),
                )),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: _backPressed,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.grey[50],
          title: Text('Swadeshi'),
          centerTitle: true,
          elevation: 0,

        ),
        drawer: MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: GradientText(
                  '# MAKE IN INDIA',
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.deepOrange, Colors.pink]),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 37,
                    fontFamily: 'BalsamiqSans'
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showSearch(
                context: context,
                delegate: SearchProducts(),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                width: width*0.9,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  //color: Colors.grey,
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 33,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Search',
                        style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
