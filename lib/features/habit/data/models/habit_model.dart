import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int iconCodePoint;

  @HiveField(3)
  int colorValue;

  @HiveField(4)
  List<DateTime> completions;

  HabitModel({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.colorValue,
    this.completions = const [],
  });

  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  Color get color => Color(colorValue);
}

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 0;

  @override
  HabitModel read(BinaryReader reader) {
    return HabitModel(
      id: reader.readInt(),
      name: reader.readString(),
      iconCodePoint: reader.readInt(),
      colorValue: reader.readInt(),
      completions: (reader.readList().cast<DateTime>()),
    );
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeInt(obj.id)
      ..writeString(obj.name)
      ..writeInt(obj.iconCodePoint)
      ..writeInt(obj.colorValue)
      ..writeList(obj.completions);
  }
}
