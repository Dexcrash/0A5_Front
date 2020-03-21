import 'package:flutter/cupertino.dart';

class Category {
  final String name;
  final String picturePath;
  final String description;

  Category({
    @required this.description,
    @required this.name,
    @required this.picturePath
  });
}