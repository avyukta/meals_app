import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/Category-Meals-Screen';

  // final String id;
  // final String title;
  // CategoryMealScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imgurl: categoryMeals[index].imgurl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordable,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
