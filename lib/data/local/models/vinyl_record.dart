import 'package:isar/isar.dart';

part 'vinyl_record.g.dart';

@collection
class VinylRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? discogsId;

  String? title;

  String? artist;

  String? label;

  String? releaseFormat; // Single, EP, Album

  String? coverUrl;

  DateTime? dateAdded;

  List<Track>? tracks;
}

@embedded
class Track {
  String? position; // e.g., "A1", "B1"

  String? title;

  String? duration;

  double? bpm;

  String? key;

  List<String>? tags;

  bool isBpmManual = false;

  bool isKeyManual = false;
}
