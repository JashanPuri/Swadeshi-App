import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../category_data.dart';
import 'category_item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          children: CATEGORIES
              .map(
                  (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.imageLogo,
                catData.cardColor
                //catData.color
              )
          )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.8/2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10
          ),
        )
    );
  }
}
