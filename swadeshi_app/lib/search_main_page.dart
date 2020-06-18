import 'package:flutter/material.dart';
import 'package:swadeshi_app/category_data.dart';

import 'home_screen/category_item.dart';

class SearchCategoriesAndProducts extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var resultList = CATEGORIES.where((element) {
      return element.title.toLowerCase().contains(query.toLowerCase());
    });
    return query == ""
        ? Container()
        : GridView(
            padding: const EdgeInsets.all(10),
            children: resultList
                .map((catData) => CategoryItem(category: catData,
                    //catData.color
                    ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.8 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = CATEGORIES.where((element) {
      return element.title.toLowerCase().contains(query.toLowerCase());
    });
    return query == ""
        ? Container()
        : GridView(
          padding: const EdgeInsets.all(10),
          children: suggestionList
              .map((catData) => CategoryItem(category: catData,
                  //catData.color
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.8 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10),
        );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          textTheme: TextTheme(
            headline6: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.normal,
                ),
          ),
        );
  }
}
