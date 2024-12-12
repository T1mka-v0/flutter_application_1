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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Радиус скругления
          child: Image.asset(
            'assets/$assetName',
            width: 200,
            height: 200,
            fit: BoxFit.cover, // Настройка отображения изображения
          ),
        ),
        Text(title),
        Text(recipe),
      ],
    );
  }
}
