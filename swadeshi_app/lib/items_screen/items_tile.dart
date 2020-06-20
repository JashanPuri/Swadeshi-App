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
        // isThreeLine: true,
        title: Text(
          itemTile.name,
          style: _theme.textTheme.headline5.copyWith(color: Colors.black),
        ),
        subtitle: Text('${itemTile.company}'),
        trailing: Column(
          children: <Widget>[
            Text(
              itemTile.title,
              style: _theme.textTheme.headline5
                  .copyWith(color: Colors.black54, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: itemTile.indian
                  ? FittedBox(
                      child: Image.asset(
                      'assets/indian_flag_image/indian_logo.png',
                      height: 25,
                      width: 30,
                    ))
                  : Text(
                      'Imported',
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
