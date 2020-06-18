import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

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
  bool onlyIndian = false;

  switchIndian() {
    setState(() {
      onlyIndian = !onlyIndian;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    List<Item> finalListItems = onlyIndian
        ? widget.items.where((element) => element.indian).toList()
        : widget.items;

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
                    onPressed: () {},
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          onlyIndian = !onlyIndian;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        width: 85,
                        height: 30,
                        decoration: BoxDecoration(
                          color: onlyIndian
                              ? Colors.greenAccent[100]
                              : Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: <Widget>[
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                              top: 3.0,
                              left: onlyIndian ? 55 : 0,
                              right: onlyIndian ? 0 : 55,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 1000),
                                transitionBuilder: (child, animation) {
                                  return RotationTransition(
                                    child: child,
                                    turns: animation,
                                  );
                                },
                                child: onlyIndian
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/indian_flag_image/indian_flag.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.red,
                                        key: UniqueKey(),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print(finalListItems.length);
                      return finalListItems.isEmpty
                          ? Center(
                              child: Text('No Products Available !!'),
                            )
                          : ItemTile(
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
