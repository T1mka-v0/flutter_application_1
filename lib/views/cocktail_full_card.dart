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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(16.0), // Радиус скругления
            //     child: ),
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                'assets/$assetName',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover, // Настройка отображения изображения
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
