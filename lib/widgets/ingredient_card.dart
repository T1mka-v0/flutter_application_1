import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/my_ingredients_provider.dart';

class IngredientCard extends StatelessWidget {
  final String title;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final String assetName;
  const IngredientCard(
      {required this.title,
      required this.onAdd,
      required this.onDelete,
      required this.assetName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'assets/ingredients/$assetName.webp',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Text(title),
        Consumer<MyIngredients>(builder: (context, ingredientsList, child) {
          return ElevatedButton(
              onPressed: ingredientsList.getMyIngredients.contains(title)
                  ? onDelete
                  : onAdd,
              child: ingredientsList.getMyIngredients.contains(title)
                  ? const Text('Удалить')
                  : const Icon(Icons.add_rounded));
        }),
      ],
    ));
  }
}
