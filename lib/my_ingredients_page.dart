import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/my_ingredients.dart';
import 'package:provider/provider.dart';

class MyIngredientsPage extends StatelessWidget {
  const MyIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
          child: Consumer<MyIngredients>(builder: (context, ingredient, child) {
        return ListView.builder(
            itemCount: ingredient.myIngredients.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(ingredient.myIngredients[index]));
            });
      })),
    );
  }
}
