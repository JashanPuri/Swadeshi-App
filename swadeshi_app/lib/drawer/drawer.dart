import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String title, IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
      onTap: tapHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: height*0.3,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              //alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 70,
                      child: Image.asset('assets/other_images/drawer_image.png',)
                  ),
                  FittedBox(
                    child: Text(
                      'A good product can speak globally !!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'BalsamiqSans',
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
              'Categories',
              Icons.category,
                  (){
                Navigator.of(context).pushReplacementNamed('/category-screen');
              }
          ),
          SizedBox(height: 20),
          buildListTile(
              'Info',
              Icons.info,
                  (){
                Navigator.of(context).pushReplacementNamed('/info-page');
              }
          )
        ],
      ),
    );
  }
}
