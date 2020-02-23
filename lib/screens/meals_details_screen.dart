import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/Meals-Details-Screen';
  Widget listviewContainer(List<String> listItems, String title) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Center(
                          child: Text(
                        '# ${(index + 1).toString()}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        width: 240,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            listItems[index],
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: listItems.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final mealItem = DUMMY_MEALS.firstWhere((meal) {
      return meal.id.contains(mealId);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 240,
              width: double.infinity,
              child: Image.network(
                mealItem.imgurl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: <Widget>[
                  listviewContainer(mealItem.ingredients, 'Ingredients'),
                  listviewContainer(mealItem.steps, 'Steps'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
