import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../data/local/database_service.dart';
import '../data/local/models/vinyl_record.dart';

class BpmEnrichmentService {
  final DatabaseService dbService;
  final Dio dio;

  BpmEnrichmentService(this.dbService) : dio = Dio();

  /// Background processor method to be called after a sync or on a scheduled timer.
  /// (Using async/await in the main isolate is fine for a PWA, but for heavier tasks
  /// on mobile, this would be wrapped in an Isolate using `compute` or `Isolate.spawn`).
  Future<void> runEnrichmentCycle() async {
    final isar = dbService.isar;

    // Find all records that have Tracks with no BPM and aren't manually set
    // Note: Isar does not currently support querying nested properties of embedded lists easily
    // So we fetch all records and filter them. For large databases, consider storing Tracks as separate Collections.
    final allRecords = await isar.vinylRecords.where().findAll();

    for (var record in allRecords) {
      bool updated = false;

      if (record.tracks != null) {
        for (var track in record.tracks!) {
          // If BPM is null and user didn't manually set it yet
          if (track.bpm == null && !track.isBpmManual) {
            final bpmText = await _fetchBpmForTrack(
              record.artist ?? '',
              track.title ?? record.title ?? '',
            );

            if (bpmText != null) {
              track.bpm = double.tryParse(bpmText);
              updated = true;
            }

            // Introduce artificial delay to avoid hammering rate limits
            await Future.delayed(const Duration(milliseconds: 500));
          }
        }
      }

      // Save the updated record back to Isar
      if (updated) {
        await isar.writeTxn(() async {
          await isar.vinylRecords.put(record);
        });
      }
    }
  }

  /// Reaches out to the GetSongBPM or alternative API to extract a matching BPM.
  Future<String?> _fetchBpmForTrack(String artist, String title) async {
    try {
      // Mocking GetSongBPM string fetch for the MVP structure
      // Real API: GET https://api.getsongbpm.com/search/?type=both&lookup=artist+title
      return '128';
    } catch (e) {
      return null;
    }
  }
}
