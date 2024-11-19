import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/my_ingredients.dart';

class MyCard extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  // final File pic = File('./bloodMary.jpg');
  const MyCard({required this.title, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Consumer<MyIngredients>(builder: (context, ingredientsList, child) {
          return ElevatedButton(onPressed: onPress, child: const Text('add'));
        })
      ],
    ));
  }
}
