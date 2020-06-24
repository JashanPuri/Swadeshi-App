import 'package:flutter/material.dart';
import 'package:swadeshi_app/models/item.dart';

import '../animatedToggleButton.dart';
import '../category_data.dart';
import '../item_data.dart';
import 'category_item.dart';
import '../items_screen/items_tile.dart';

class SearchCategoriesAndProducts extends SearchDelegate {
  bool showCategories = false;
  bool showInHindi;
  SearchCategoriesAndProducts(this.showInHindi);

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
    var resultList = showCategories
        ? CATEGORIES.where((element) {
            return element.title.toLowerCase().contains(query.toLowerCase());
          }).toList()
        : (showInHindi ? ITEMS_HINDI : ITEMS).where((element) {
            return element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.title.toLowerCase().contains(query.toLowerCase()) ||
                element.company.toLowerCase().contains(query.toLowerCase());
          }).toList();

    if (!showCategories)
      (resultList as List<Item>).sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Search categories',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 50),
                      child: AnimatedToggleButton(
                        changeState: changeState,
                        boolValue: showCategories,
                        buttonOff: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                          size: 30,
                          key: UniqueKey(),
                        ),
                        buttonOn: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 30,
                          key: UniqueKey(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : showCategories
            ? GridView(
                padding: const EdgeInsets.all(10),
                children: resultList
                    .map((catData) => CategoryItem(
                      showInHindi: showInHindi,
                          category: catData,
                          //catData.color
                        ))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.8 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
              )
            : ListView.builder(
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                    itemTile: resultList[index],
                  );
                },
              );
  }

  void changeState() {
    showCategories = !showCategories;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = showCategories
        ? CATEGORIES.where((element) {
            return element.title.toLowerCase().contains(query.toLowerCase());
          }).toList()
        : (showInHindi ? ITEMS_HINDI : ITEMS).where((element) {
            return element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.title.toLowerCase().contains(query.toLowerCase()) ||
                element.company.toLowerCase().contains(query.toLowerCase());
          }).toList();

    if (!showCategories)
      (suggestionList as List<Item>).sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Search categories',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 50),
                      child: AnimatedToggleButton(
                        changeState: changeState,
                        boolValue: showCategories,
                        buttonOff: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                          size: 30,
                          key: UniqueKey(),
                        ),
                        buttonOn: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 30,
                          key: UniqueKey(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : showCategories
            ? GridView(
                padding: const EdgeInsets.all(10),
                children: suggestionList
                    .map((catData) => CategoryItem(
                          category: catData,
                          showInHindi: showInHindi,
                          //catData.color
                        ))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.8 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
              )
            : ListView.builder(
                itemCount: suggestionList.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                    itemTile: suggestionList[index],
                  );
                },
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
