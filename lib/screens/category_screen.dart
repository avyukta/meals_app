import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummy-data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: GridView(
          padding: EdgeInsets.all(15),
          children: DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(
              id: catData.id,
              title: catData.title,
              color: catData.color,
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
