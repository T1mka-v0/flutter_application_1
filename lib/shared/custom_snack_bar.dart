import 'package:flutter/material.dart';

SnackBar snackBarOnIngredientChange(String text) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(milliseconds: 200),
  );
}
