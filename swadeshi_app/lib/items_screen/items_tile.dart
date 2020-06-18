import 'package:flutter/material.dart';
import 'package:swadeshi_app/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item itemTile;

  ItemTile({this.itemTile});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: ListTile(
        title: Text(
          itemTile.name,
          style: _theme.textTheme.headline5.copyWith(color: Colors.black),
        ),
        subtitle: Text(itemTile.company),
        trailing: Text(
          itemTile.title,
          style: _theme.textTheme.headline5.copyWith(color: Colors.black54,fontSize: 16),
        ),
      ),
    );
  }
}
