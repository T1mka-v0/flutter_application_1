import 'package:flutter/material.dart';
import '../data/ingredients.dart';
import '../widgets/ingredient_card.dart';
import 'package:provider/provider.dart';
import '../app/my_ingredients_provider.dart';
import '../shared/custom_snack_bar.dart';
import '../widgets/custom_text_field.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: customTextField(searchIngredients, _controller)),
        ...filteredIngredients.map((ingredient) {
          return IngredientCard(
            title: ingredient,
            assetName: 'vodka',
            onAdd: () {
              if (!myIngredients.getMyIngredients.contains(ingredient)) {
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBarOnIngredientChange('Ингредиент добавлен!'));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBarOnIngredientChange(
                        'Ингредиент уже добавлен в ваш список!'));
              }
              myIngredients.addIngredient(ingredient);
            },
            onDelete: () {
              if (myIngredients.getMyIngredients.contains(ingredient)) {
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBarOnIngredientChange('Ингредиент удалён!'));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBarOnIngredientChange(
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
