import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'models/vinyl_record.dart';

class DatabaseService {
  late final Isar isar;

  Future<void> init() async {
    if (Isar.instanceNames.isEmpty) {
      String? directory;
      if (!kIsWeb) {
        final dir = await getApplicationDocumentsDirectory();
        directory = dir.path;
      }
      isar = await Isar.open(
        [VinylRecordSchema],
        directory: directory ?? '',
        inspector: !kReleaseMode,
      );
    } else {
      isar = Isar.getInstance()!;
    }
  }
}
