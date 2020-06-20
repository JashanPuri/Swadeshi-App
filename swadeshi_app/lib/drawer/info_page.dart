import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer/info_data.dart';
import '../drawer/drawer.dart';

class InfoPage extends StatelessWidget {

  final controller = PageController(
    initialPage: 0
  );

  Widget cardBuilder(String str,Image image){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(20),
      color: Colors.grey[100],
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: ClipRRect(
              child: image,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                str,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'BalsamiqSans'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Info'),
    );
    final height=MediaQuery.of(context).size.height-appbar.preferredSize.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      drawer: MainDrawer(),
      body: PageView(
        controller: controller,
        pageSnapping: true,
        children: [
          cardBuilder(INFORMATION[0], Image.asset('assets/other_images/info_page1.png',fit: BoxFit.cover,)),
          cardBuilder(INFORMATION[1], Image.asset('assets/other_images/info_page2.jpg',fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}
