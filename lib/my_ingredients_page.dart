import 'package:flutter/material.dart';
import 'package:flutter_application_1/card.dart';
import 'package:flutter_application_1/data/my_ingredients.dart';
import 'package:provider/provider.dart';
import 'shared/customSnackBar.dart';

class MyIngredientsPage extends StatelessWidget {
  const MyIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myIngredients = Provider.of<MyIngredients>(context);
    return Center(child:
        Consumer<MyIngredients>(builder: (context, myIngredientList, child) {
      return ListView.builder(
          itemCount: myIngredientList.totalCountOfIngredients,
          itemBuilder: (context, index) {
            String ingredient = myIngredientList.getMyIngredients[index];
            return MyCard(
                title: ingredient,
                onAdd: () {
                  if (!myIngredients.getMyIngredients.contains(ingredient)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarOnIngredientChange('Ингредиент добавлен!'));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarOnIngredientChange(
                            'Ингредиент уже добавлен в ваш список!'));
                  }
                  myIngredients.addIngredient(ingredient);
                },
                onDelete: () {
                  if (myIngredients.getMyIngredients.contains(ingredient)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarOnIngredientChange('Ингредиент удалён!'));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarOnIngredientChange(
                            'Ингредиент отсутствует в вашем списке!'));
                  }
                  myIngredients.deleteIngredient(ingredient);
                },
                assetName: 'vodka.webp');
          });
    }));
  }
}
