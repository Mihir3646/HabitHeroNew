// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_model.dart';

class CompletionModelAdapter extends TypeAdapter<CompletionModel> {
  @override
  final int typeId = 1;

  @override
  CompletionModel read(BinaryReader reader) {
    return CompletionModel(habitKey: reader.readInt(), date: reader.readDateTime());
  }

  @override
  void write(BinaryWriter writer, CompletionModel obj) {
    writer.writeInt(obj.habitKey);
    writer.writeDateTime(obj.date);
  }
}
