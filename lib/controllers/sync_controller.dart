import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import '../data/local/database_service.dart';
import '../data/network/discogs_sync_service.dart';
import '../data/local/models/vinyl_record.dart';

part 'sync_controller.g.dart';

class SyncState {
  final bool isSyncing;
  final int itemsImported;
  final String? error;

  SyncState({required this.isSyncing, this.itemsImported = 0, this.error});

  SyncState copyWith({bool? isSyncing, int? itemsImported, String? error}) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      itemsImported: itemsImported ?? this.itemsImported,
      error: error ?? this.error,
    );
  }
}

// Dummy providers until full DI is set
// These normally would be passed in or accessed via Riverpod providers.
// I'll define temporary stubs for them so the class is correct.
late DatabaseService mockDatabaseService;
late DiscogsSyncService mockSyncService;

@riverpod
class SyncController extends _$SyncController {
  @override
  SyncState build() {
    return SyncState(isSyncing: false);
  }

  Future<void> startSync(
    String username,
    DatabaseService dbService,
    DiscogsSyncService syncService,
  ) async {
    if (state.isSyncing) return;

    state = state.copyWith(isSyncing: true, itemsImported: 0, error: null);

    try {
      int page = 1;
      bool hasMore = true;
      int totalImported = 0;
      final isar = dbService.isar;

      while (hasMore) {
        final records = await syncService.fetchCollectionPage(
          username,
          page: page,
        );

        if (records.isEmpty) {
          hasMore = false;
          break;
        }

        final List<VinylRecord> newRecords = [];

        // Delta Sync: check if we've hit a known record.
        for (var record in records) {
          final existing = await isar.vinylRecords
              .where()
              .discogsIdEqualTo(record.discogsId)
              .findFirst();

          if (existing != null) {
            // We found a record we already have. Stop syncing completely!
            hasMore = false;
            break;
          } else {
            newRecords.add(record);
          }
        }

        if (newRecords.isNotEmpty) {
          // Batch insert into Isar
          await isar.writeTxn(() async {
            await isar.vinylRecords.putAll(newRecords);
          });

          totalImported += newRecords.length;

          // Stream updates to the Riverpod state
          state = state.copyWith(itemsImported: totalImported);
        }

        // If we processed everything on this page and didn't hit a known record, load next page.
        if (hasMore) {
          page++;
        }
      }

      state = state.copyWith(isSyncing: false);
    } catch (e) {
      state = state.copyWith(isSyncing: false, error: e.toString());
    }
  }
}
