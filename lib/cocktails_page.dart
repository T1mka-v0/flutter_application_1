import 'package:flutter/material.dart';
import 'data/сocktails.dart';

// Предполагается, что у вас уже есть класс MyCard

class CocktailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, List<String>>> cocktailList =
        cocktails.entries.toList();

    List<Widget> cardWidgets = cocktailList.map((entry) {
      return Card(
        child: Text(entry.key),
        // ingredients: entry.value,
      );
    }).toList();

    return ListView(
      children: cardWidgets,
    );
  }
}
