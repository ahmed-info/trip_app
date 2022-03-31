import 'package:flutter/material.dart';
import 'package:trip_app/app_data.dart';
import 'package:trip_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      children: Categories_data.map((e) =>
              CategoryItem(id: e.id, title: e.title, imageUrl: e.imageUrl))
          .toList(),
    );
  }
}
