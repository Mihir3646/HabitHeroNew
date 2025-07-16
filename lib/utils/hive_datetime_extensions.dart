import 'package:hive/hive.dart';

extension BinaryReaderDateTime on BinaryReader {
  DateTime readDateTime() => DateTime.fromMillisecondsSinceEpoch(readInt());
}

extension BinaryWriterDateTime on BinaryWriter {
  void writeDateTime(DateTime value) => writeInt(value.millisecondsSinceEpoch);
}
