import 'package:flutter/material.dart';

import '../items_screen/items_tile.dart';
import '../models/item.dart';

class ItemSearch extends SearchDelegate {
  List<Item> itemList;
  ItemSearch({this.itemList});

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
    var resultList = itemList.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
          element.title.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase()) ||
          element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
          element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
          element.company_hindi.toLowerCase().contains(query.toLowerCase());
    }).toList();

    resultList.sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Container()
        : ListView.builder(
            itemBuilder: (context, index) => ItemTile(
              itemTile: resultList[index],
            ),
            itemCount: resultList.length,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = itemList.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
          element.title.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase()) ||
          element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
          element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
          element.company_hindi.toLowerCase().contains(query.toLowerCase());
    }).toList();
    suggestionList.sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Container()
        : ListView.builder(
            itemBuilder: (context, index) => ItemTile(
              itemTile: suggestionList[index],
            ),
            itemCount: suggestionList.length,
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
