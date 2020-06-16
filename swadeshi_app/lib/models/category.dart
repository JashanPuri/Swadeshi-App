import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Image imageLogo;
  final Color cardColor;

  Category({
    @required this.id,
    @required this.title,
    this.imageLogo,
    @required this.cardColor
  });
}
