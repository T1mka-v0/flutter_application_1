import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/my_ingredients.dart';

class MyCard extends StatelessWidget {
  final String title;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  // final File pic = File('./bloodMary.jpg');
  const MyCard(
      {required this.title,
      required this.onAdd,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Consumer<MyIngredients>(builder: (context, ingredientsList, child) {
          return ElevatedButton(
              onPressed: ingredientsList.getMyIngredients.contains(title)
                  ? onDelete
                  : onAdd,
              child: ingredientsList.getMyIngredients.contains(title)
                  ? const Text('Удалить')
                  : const Text('Добавить'));
        })
      ],
    ));
  }
}
