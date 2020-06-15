import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Image imageLogo;
  final Color cardColor;

  const Category({@required this.id, this.imageLogo, @required this.title,this.cardColor});
}
