import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/my_ingredients.dart';
import 'package:provider/provider.dart';

class MyIngredientsPage extends StatelessWidget {
  const MyIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:
        Consumer<MyIngredients>(builder: (context, myIngredientList, child) {
      return ListView.builder(
          itemCount: myIngredientList.totalCountOfIngredients,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(myIngredientList.getMyIngredients[index]));
          });
    }));
  }
}
