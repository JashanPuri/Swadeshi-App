import 'package:flutter/material.dart';
import 'package:swadeshi_app/animatedToggleButton.dart';
import 'package:swadeshi_app/category_data.dart';
import 'package:swadeshi_app/item_data.dart';

import 'home_screen/category_item.dart';
import 'items_screen/items_tile.dart';

class SearchCategoriesAndProducts extends SearchDelegate {
  bool showProducts = false;

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
    var resultList = showProducts
        ? ITEMS.where((element) {
            return element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.title.toLowerCase().contains(query.toLowerCase());
          }).toList()
        : CATEGORIES.where((element) {
            return element.title.toLowerCase().contains(query.toLowerCase());
          }).toList();
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
                        'Search by products',
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
                        boolValue: showProducts,
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
        : showProducts
            ? ListView.builder(
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                    itemTile: resultList[index],
                  );
                },
              )
            : GridView(
                padding: const EdgeInsets.all(10),
                children: resultList
                    .map((catData) => CategoryItem(
                          category: catData,
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

  void changeState() {
    showProducts = !showProducts;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = showProducts
        ? ITEMS.where((element) {
            return element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.title.toLowerCase().contains(query.toLowerCase());
          }).toList()
        : CATEGORIES.where((element) {
            return element.title.toLowerCase().contains(query.toLowerCase());
          }).toList();
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
                        'Search by products',
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
                        boolValue: showProducts,
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
        : showProducts
            ? ListView.builder(
                itemCount: suggestionList.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                    itemTile: suggestionList[index],
                  );
                },
              )
            : GridView(
                padding: const EdgeInsets.all(10),
                children: suggestionList
                    .map((catData) => CategoryItem(
                          category: catData,
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
