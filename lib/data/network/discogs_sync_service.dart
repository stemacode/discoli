import 'package:dio/dio.dart';
import '../../data/local/models/vinyl_record.dart';

class DiscogsSyncService {
  final Dio dio;

  DiscogsSyncService(this.dio);

  Future<List<VinylRecord>> fetchCollectionPage(
    String username, {
    int page = 1,
    int perPage = 50,
  }) async {
    final response = await dio.get(
      '/users/$username/collection/folders/0/releases',
      queryParameters: {
        'page': page,
        'per_page': perPage,
        'sort': 'added',
        'sort_order': 'desc',
      },
    );

    final data = response.data;
    if (data == null || data['releases'] == null) {
      return [];
    }

    final releases = data['releases'] as List;
    return releases
        .map((releaseJson) => _mapToVinylRecord(releaseJson))
        .toList();
  }

  VinylRecord _mapToVinylRecord(Map<String, dynamic> json) {
    final basicInfo = json['basic_information'] ?? {};
    final dateAddedStr = json['date_added'];

    final record = VinylRecord()
      ..discogsId = json['id'] as int?
      ..title = basicInfo['title'] as String?
      ..coverUrl = basicInfo['cover_image'] as String?
      ..dateAdded = dateAddedStr != null
          ? DateTime.tryParse(dateAddedStr)
          : null;

    final artistsJson = basicInfo['artists'] as List?;
    if (artistsJson != null && artistsJson.isNotEmpty) {
      record.artist = artistsJson.first['name'] as String?;
    }

    final labelsJson = basicInfo['labels'] as List?;
    if (labelsJson != null && labelsJson.isNotEmpty) {
      record.label = labelsJson.first['name'] as String?;
    }

    final formatsJson = basicInfo['formats'] as List?;
    if (formatsJson != null && formatsJson.isNotEmpty) {
      final textParts = formatsJson.first['text'];
      if (textParts is String) {
        record.releaseFormat = textParts;
      } else if (textParts is List && textParts.isNotEmpty) {
        record.releaseFormat = textParts.first.toString();
      } else {
        record.releaseFormat = formatsJson.first['name'] as String?;
      }
    }

    // Attempt to map tracks
    final tracklistJson = basicInfo['tracklist'] as List?;
    if (tracklistJson != null) {
      final tracks = tracklistJson.map((trackJson) {
        return Track()
          ..position = trackJson['position'] as String?
          ..title = trackJson['title'] as String?
          ..duration = trackJson['duration'] as String?
          ..isBpmManual = false
          ..isKeyManual = false;
      }).toList();
      record.tracks = tracks;
    } else {
      record.tracks = []; // Initialize empty list
    }

    return record;
  }
}
