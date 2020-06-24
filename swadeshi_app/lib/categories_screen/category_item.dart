import 'package:flutter/material.dart';

import '../models/category.dart';
import '../items_screen/item_screen.dart';
import '../models/item.dart';
import '../item_data.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  List<Item> get itemsPerCategory {
    return ITEMS.where((element) {
      return element.id == category.id;
    }).toList();
  }

  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemScreen(
              category: category,
              items: itemsPerCategory,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
            //height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    category.cardColor.withOpacity(1),
                    category.cardColor.withOpacity(0.8),
                    category.cardColor.withOpacity(0.73)
                  ],
                  stops: [
                    0.55,
                    0.8,
                    1
                  ]),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Hero(
                    tag: category.id,
                    child: category.imageLogo,
                  ),
                ),
                // SizedBox(height: 5,),
                FittedBox(
                  child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.headline6,
                    softWrap: true,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
