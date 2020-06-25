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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemTile.name,
              style: _theme.textTheme.headline5.copyWith(color: Colors.black),
            ),
            Text(
              itemTile.name_hindi,
              style: _theme.textTheme.headline1,
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${itemTile.company}',
              style: _theme.textTheme.headline5.copyWith(color: Colors.black)),
            Text(
                '${itemTile.company_hindi}',
                style: _theme.textTheme.headline1
            )
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "${itemTile.title}",
              style: _theme.textTheme.headline5
                  .copyWith(color: Colors.black54, fontSize: 15),
            ),
            //Text('${itemTile.title_hindi}'),
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
