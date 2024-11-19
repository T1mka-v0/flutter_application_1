import 'dart:collection';

import 'package:flutter/material.dart';

class MyIngredients extends ChangeNotifier {
  final List<Map<String, dynamic>> _myIngredients = [
    {"id": 0, "title": "водка"}
  ];
  UnmodifiableListView<String> get myIngredients =>
      UnmodifiableListView(_myIngredients);
  int get totalCountOfIngredients => _myIngredients.length;
  void addIngredient(String ingredient) {
    _myIngredients.add(ingredient);
    notifyListeners();
  }

  void deleteIngredient(String ingredient) {
    _myIngredients.remove(ingredient);
    notifyListeners();
  }
}

// MyIngredients ingredientsList = MyIngredients();