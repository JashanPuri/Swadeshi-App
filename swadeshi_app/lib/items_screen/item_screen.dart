import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:swadeshi_app/animatedToggleButton.dart';

import '../items_screen/items_search.dart';
import '../items_screen/items_tile.dart';
import '../models/category.dart';
import '../models/item.dart';

class ItemScreen extends StatefulWidget {
  final List<Item> items;
  final Category category;

  ItemScreen({this.items, this.category});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool showAll = false;

  void switchIndian() {
    setState(() {
      showAll = !showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    List<Item> finalListItems = showAll
        ? widget.items
        : widget.items.where((element) => element.indian).toList();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              pinned: true,
              centerTitle: true,
              title: Text(
                widget.category.title,
                style: _theme.textTheme.headline5,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => showSearch(
                        context: context,
                        delegate: ItemSearch(itemList: widget.items)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: IconButton(
                //     icon: Icon(Icons.filter_list),
                //     onPressed: () => showFilter(context),
                //   ),
                // ),
              ],
              expandedHeight: 210,
              flexibleSpace: Container(
                margin: EdgeInsets.only(top: 45, bottom: 5),
                height: 200,
                child: Hero(
                  tag: widget.category.id,
                  child: Image(
                    image: widget.category.imageLogo.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Show all products',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.grey[700],
                              fontSize: 17,
                            ),
                      ),
                    ),
                    AnimatedToggleButton(
                      boolValue: showAll,
                      changeState: switchIndian,
                      buttonOff: Padding(
                        padding: const EdgeInsets.only(top: 2.8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/indian_flag_image/indian_flag.png",
                              height: 25,
                              width: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      buttonOn: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 30,
                        key: UniqueKey(),
                      ),
                    )
                  ],
                ),
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: SliverList(
                  delegate: finalListItems.isEmpty
                      ? SliverChildListDelegate([
                          Center(
                            child: Text(
                              'No Products !!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.black, fontSize: 25),
                            ),
                          )
                        ])
                      : SliverChildBuilderDelegate(
                          (context, index) {
                            return ItemTile(
                              itemTile: finalListItems[index],
                            );
                          },
                          childCount: finalListItems.length,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
