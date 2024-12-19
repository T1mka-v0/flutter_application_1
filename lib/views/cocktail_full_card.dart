import 'package:flutter/material.dart';

class CocktailFullCard extends StatelessWidget {
  final String assetName;
  final String title;
  final String recipe;

  const CocktailFullCard(
      {super.key,
      required this.assetName,
      required this.title,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    List<String> recipePoints = recipe.split('. ');
    var finalRecipe = '';
    for (int i = 0; i < recipePoints.length; i++) {
      finalRecipe += '$i. ${recipePoints[i]}';
      // return finalRecipe;
    }
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Image.asset(
              'assets/cocktails/$assetName.webp',
              fit: BoxFit.cover, // Настройка отображения изображения
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Рецепт:\n$recipe'.split('. ').join('\n'),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
