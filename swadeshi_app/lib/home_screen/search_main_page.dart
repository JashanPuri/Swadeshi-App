import 'package:flutter/material.dart';

import '../items_screen/items_tile.dart';
import '../item_data.dart';

class SearchProducts extends SearchDelegate {
  bool showInHindi;

  SearchProducts(this.showInHindi);

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
    var resultList = (showInHindi ? ITEMS_HINDI : ITEMS).where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
          element.title.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase());
    }).toList();

    resultList.sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Container()
        : ListView.builder(
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              return ItemTile(
                itemTile: resultList[index],
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = (showInHindi ? ITEMS_HINDI : ITEMS).where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
          element.title.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase());
    }).toList();

    suggestionList.sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Container()
        : ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ItemTile(
                  itemTile: suggestionList[index],
                ),
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
