import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/my_ingredients.dart';

class MyCard extends StatelessWidget {
  final String title;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final String assetName;
  // final File pic = File('./bloodMary.jpg');
  const MyCard(
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
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Радиус скругления
          child: Image.asset(
            'assets/$assetName',
            width: 200,
            height: 200,
            fit: BoxFit.cover, // Настройка отображения изображения
          ),
        )
      ],
    ));
  }
}
