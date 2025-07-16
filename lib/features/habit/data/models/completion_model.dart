import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class CompletionModel extends HiveObject {
  @HiveField(0)
  final int habitId;

  @HiveField(1)
  final DateTime date;

  CompletionModel({required this.habitId, required this.date});
}

class CompletionModelAdapter extends TypeAdapter<CompletionModel> {
  @override
  final int typeId = 1;

  @override
  CompletionModel read(BinaryReader reader) {
    return CompletionModel(
      habitId: reader.readInt(),
      date: reader.readDateTime(),
    );
  }

  @override
  void write(BinaryWriter writer, CompletionModel obj) {
    writer
      ..writeInt(obj.habitId)
      ..writeDateTime(obj.date);
  }
}
