

import 'dart:ui';
class CategoryModel{
  String id;
  String title;
  String path;
  TextDirection textDirection;
  CategoryModel({required this.title,required this.path,required this.id,this.textDirection=TextDirection.ltr});
}