import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'my_ingredients_provider.g.dart';

@HiveType(typeId: 0)
class MyIngredients extends HiveObject with ChangeNotifier {
  @HiveField(0)
  List<String> myIngredients = [];

  List<String> get getMyIngredients => UnmodifiableListView(myIngredients);
  int get totalCountOfIngredients => myIngredients.length;
  void addIngredient(String ingredient) {
    if (myIngredients.contains(ingredient)) {
      return;
    } else {
      myIngredients.add(ingredient);
      notifyListeners();
      // Hive.box<List<String>>('myIngredientsBox')
      //     .put('ingredients', myIngredients);
      save();
    }
  }

  void deleteIngredient(String ingredient) {
    if (myIngredients.contains(ingredient)) {
      myIngredients.remove(ingredient);
      notifyListeners();
      // Hive.box<List<String>>('myIngredientsBox')
      //     .put('ingredients', myIngredients);
      save();
    } else {
      return;
    }
  }
}
