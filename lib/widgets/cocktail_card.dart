import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/my_ingredients_provider.dart';

class CocktailCard extends StatelessWidget {
  final String assetName;
  final String title;
  final List<String> neededIngredients;

  const CocktailCard(
      {required this.assetName,
      required this.title,
      required this.neededIngredients,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/cocktails/$assetName.webp',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(title),
              ),
              Consumer<MyIngredients>(
                  builder: (context, ingredientsList, child) {
                var ownIngredientsCount = 0;
                for (String my_ in ingredientsList.getMyIngredients) {
                  for (String _ in neededIngredients) {
                    if (_ == my_) {
                      ownIngredientsCount++;
                    }
                  }
                }
                print('Количество нужных ингредиентов: $ownIngredientsCount');
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                      '$ownIngredientsCount / ${neededIngredients.length}'),
                );
              }),
            ],
          ),
        ));
  }
}
