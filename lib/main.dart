import 'package:flutter/material.dart';

import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CategoryScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => CategoryScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
    );
  }
}
