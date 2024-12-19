import 'package:flutter/material.dart';
import '../widgets/ingredient_card.dart';
import '../app/my_ingredients_provider.dart';
import 'package:provider/provider.dart';
import '../shared/custom_snack_bar.dart';

class MyIngredientsPage extends StatelessWidget {
  const MyIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myIngredients = Provider.of<MyIngredients>(context);
    return Center(child:
        Consumer<MyIngredients>(builder: (context, myIngredientList, child) {
      return myIngredients.getMyIngredients.isNotEmpty
          ? ListView.builder(
              itemCount: myIngredientList.totalCountOfIngredients,
              itemBuilder: (context, index) {
                String ingredient = myIngredientList.getMyIngredients[index];
                return IngredientCard(
                    title: ingredient,
                    onAdd: () {
                      if (!myIngredients.getMyIngredients
                          .contains(ingredient)) {
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
                    assetName: 'vodka');
              })
          : const Text('Добавьте ингредиенты во вкладке "Новые"');
    }));
  }
}
