import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../drawer/drawer.dart';
import '../category_data.dart';
import 'category_item.dart';
import 'search_categories_page.dart';

class CategoryScreen extends StatelessWidget {
  final bool showInHindi;

  CategoryScreen(this.showInHindi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        showSwitch: false,
      ),
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      //   body: GridView(
      //     padding: const EdgeInsets.all(10),
      //     children: CATEGORIES
      //         .map(
      //             (catData) => CategoryItem(
      //             catData.id,
      //             catData.title,
      //             catData.imageLogo,
      //           catData.cardColor
      //           //catData.color
      //         )
      //     )
      //         .toList(),
      //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //         maxCrossAxisExtent: 200,
      //         childAspectRatio: 1.8/2,
      //         crossAxisSpacing: 15,
      //         mainAxisSpacing: 10
      //     ),
      //   )

      body: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Categories'),
              elevation: 0,
              floating: true,
              centerTitle: true,
//              leading: IconButton(
//                  icon: Icon(
//                    Icons.menu,
//                    color: Colors.white,
//                  ),
//                  onPressed: () {}),
              // snap: true,
            ),
            SliverStickyHeader(
              header: Container(
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () => showSearch(
                        context: context,
                        delegate: SearchCategoriesAndProducts()),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          Expanded(
                            child: Text('   Search',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: SliverGrid(
                  delegate: SliverChildListDelegate(
                    CATEGORIES
                        .map((catData) => CategoryItem(
                              category: catData,
                              showInHindi: showInHindi,
                              // catData.color
                            ))
                        .toList(),
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.8 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
