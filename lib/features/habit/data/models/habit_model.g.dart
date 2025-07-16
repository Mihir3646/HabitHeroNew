// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 0;

  @override
  HabitModel read(BinaryReader reader) {
    return HabitModel(title: reader.readString());
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer.writeString(obj.title);
  }
}
