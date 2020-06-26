import 'package:flutter/material.dart';

import '../items_screen/items_tile.dart';
import '../item_data.dart';

class SearchProducts extends SearchDelegate {
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
    var resultListIndian = ITEMS.where((element) {
      return (element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.company.toLowerCase().contains(query.toLowerCase()) ||
              element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.company_hindi
                  .toLowerCase()
                  .contains(query.toLowerCase())) &&
          element.indian;
    }).toList();

    resultListIndian.sort((a, b) => a.name.compareTo(b.name));

    var resultListNotIndian = ITEMS.where((element) {
      return (element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.company.toLowerCase().contains(query.toLowerCase()) ||
              element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.company_hindi
                  .toLowerCase()
                  .contains(query.toLowerCase())) &&
          element.indian;
    }).toList();

    resultListNotIndian.sort((a, b) => a.name.compareTo(b.name));

    var resultList = [...resultListIndian, ...resultListNotIndian];

    resultList.sort((a, b) => a.name.compareTo(b.name));

    return query == ""
        ? Container(
            child: Image.asset('assets/other_images/empty_list.png'),
          )
        : ListView.builder(
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ItemTile(
                  itemTile: resultList[index],
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionListIndian = ITEMS.where((element) {
      return (element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.company.toLowerCase().contains(query.toLowerCase()) ||
              element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.company_hindi
                  .toLowerCase()
                  .contains(query.toLowerCase())) &&
          element.indian;
    }).toList();
    suggestionListIndian.sort((a, b) => a.name.compareTo(b.name));

    var suggestionListNotIndian = ITEMS.where((element) {
      return (element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.company.toLowerCase().contains(query.toLowerCase()) ||
              element.name_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.title_hindi.toLowerCase().contains(query.toLowerCase()) ||
              element.company_hindi.toLowerCase().contains(
                    query.toLowerCase(),
                  )) &&
          !element.indian;
    }).toList();
    suggestionListNotIndian.sort((a, b) => a.name.compareTo(b.name));

    var suggestionList = [...suggestionListIndian, ...suggestionListNotIndian];

    return query == ""
        ? Container(
            child: Image.asset('assets/other_images/empty_list.png'),
          )
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
