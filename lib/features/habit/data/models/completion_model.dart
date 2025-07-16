import 'package:hive/hive.dart';
import 'package:habithero1/utils/hive_datetime_extensions.dart';

part 'completion_model.g.dart';

@HiveType(typeId: 1)
class CompletionModel extends HiveObject {
  @HiveField(0)
  final int habitKey;

  @HiveField(1)
  final DateTime date;

  CompletionModel({required this.habitKey, required this.date});
}
