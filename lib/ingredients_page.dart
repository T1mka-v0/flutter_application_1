import 'package:flutter/material.dart';
import 'data/ingredients.dart';
import 'card.dart';
import 'package:provider/provider.dart';
import 'data/my_ingredients.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myIngredients = Provider.of<MyIngredients>(context);
    return ListView(
      children: [
        ...ingredients.map((ingredient) {
          return MyCard(
            title: ingredient,
            assetName: 'vodka.webp',
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
          );
        }),
      ],
    );
  }
}

SnackBar SnackBarOnIngredientChange(String text) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 1),
  );
}
