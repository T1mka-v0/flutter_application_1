// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ingredients_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyIngredientsAdapter extends TypeAdapter<MyIngredients> {
  @override
  final int typeId = 0;

  @override
  MyIngredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyIngredients()..myIngredients = (fields[0] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, MyIngredients obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.myIngredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyIngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
