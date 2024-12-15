import 'package:flutter/material.dart';
import '../data/ingredients.dart';
import '../widgets/ingredient_card.dart';
import 'package:provider/provider.dart';
import '../app/my_ingredients_provider.dart';
import '../shared/customSnackBar.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});
  @override
  IngredientsPageState createState() => IngredientsPageState();
}

class IngredientsPageState extends State<IngredientsPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> filteredIngredients = [];

  @override
  void initState() {
    super.initState();
    filteredIngredients = ingredients;
  }

  void searchIngredients(String query) {
    setState(() {
      filteredIngredients = ingredients.where((entry) {
        return entry.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final myIngredients = Provider.of<MyIngredients>(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
                labelText: 'Поиск...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)))),
            onChanged: searchIngredients,
          ),
        ),
        ...filteredIngredients.map((ingredient) {
          return IngredientCard(
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
