import 'package:flutter/material.dart';

SnackBar SnackBarOnIngredientChange(String text) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 1),
  );
}
