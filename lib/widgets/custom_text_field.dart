import 'package:flutter/material.dart';

TextField customTextField(
    ValueChanged<String> onChanged, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: const InputDecoration(
        labelText: 'Поиск...',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)))),
    onChanged: onChanged,
  );
}
