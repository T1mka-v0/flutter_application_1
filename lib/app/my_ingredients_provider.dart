import 'dart:collection';
import 'package:flutter/material.dart';

class MyIngredients extends ChangeNotifier {
  final List<String> _myIngredients = ['вода'];
  List<String> get getMyIngredients => UnmodifiableListView(_myIngredients);
  int get totalCountOfIngredients => _myIngredients.length;
  void addIngredient(String ingredient) {
    if (_myIngredients.contains(ingredient)) {
      return;
    } else {
      _myIngredients.add(ingredient);
      notifyListeners();
    }
  }

  void deleteIngredient(String ingredient) {
    if (_myIngredients.contains(ingredient)) {
      _myIngredients.remove(ingredient);
      notifyListeners();
    } else {
      return;
    }
  }
}
