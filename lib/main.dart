import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'data/local/models/vinyl_record.dart';
import 'controllers/sync_controller.dart';
import 'data/local/database_service.dart';
import 'data/network/discogs_sync_service.dart';
import 'data/network/discogs_auth_client.dart';
import 'data/network/discogs_auth_flow.dart';
import 'data/local/secure_storage_service.dart';

// Initialize globals for our simple app structure (normally use Providers)
late DatabaseService mockDatabaseService;
late DiscogsSyncService mockSyncService;
late DiscogsAuthFlow mockAuthFlow;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Basic DI
  final secureStorage = SecureStorageService();
  final dbService = DatabaseService();
  await dbService.init();

  final authClient = DiscogsAuthClient(secureStorage);
  final syncService = DiscogsSyncService(authClient.dio);
  final authFlow = DiscogsAuthFlow(secureStorage);

  // Initialize globals for our simple app structure (normally use Providers)
  mockDatabaseService = dbService;
  mockSyncService = syncService;
  mockAuthFlow = authFlow;

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discofy',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
          brightness: Brightness.dark,
        ),
      ),
      home: const SyncScreen(),
    );
  }
}

class SyncScreen extends ConsumerWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Discogs Sync')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (syncState.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${syncState.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Text(
              syncState.isSyncing
                  ? 'Syncing... ${syncState.itemsImported} records imported.'
                  : 'Ready to sync',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await mockAuthFlow.authorize();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Authentication Successful!'),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Auth failed: $e')));
                  }
                }
              },
              child: const Text('Authenticate with Discogs'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: syncState.isSyncing
                  ? null
                  : () {
                      // Demo username to hit the delta sync
                      ref
                          .read(syncControllerProvider.notifier)
                          .startSync(
                            'username',
                            mockDatabaseService,
                            mockSyncService,
                          );
                    },
              child: const Text('Sync Now'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final mockTrack = Track()
                  ..title = 'One More Time'
                  ..position = 'A1';
                final record = VinylRecord()
                  ..title = 'Discovery'
                  ..artist = 'Daft Punk'
                  ..tracks = [mockTrack];

                await mockDatabaseService.isar.writeTxn(() async {
                  await mockDatabaseService.isar.vinylRecords.put(record);
                });
                ref.invalidate(syncControllerProvider);
              },
              child: const Text('Add Mock Record'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<VinylRecord>>(
                future: mockDatabaseService.isar.vinylRecords.where().findAll(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No records matched/synced yet.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final record = snapshot.data![index];
                      final firstTrackBpm =
                          record.tracks?.firstOrNull?.bpm?.toString() ?? 'N/A';

                      return ListTile(
                        title: Text('${record.artist} - ${record.title}'),
                        subtitle: Text('BPM: $firstTrackBpm'),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final controller = TextEditingController(
                                  text: firstTrackBpm == 'N/A'
                                      ? ''
                                      : firstTrackBpm,
                                );
                                return AlertDialog(
                                  title: const Text('Manual BPM Override'),
                                  content: TextField(
                                    controller: controller,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'e.g. 125.0',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final newBpm = double.tryParse(
                                          controller.text,
                                        );
                                        if (newBpm != null &&
                                            record.tracks != null &&
                                            record.tracks!.isNotEmpty) {
                                          final tracks = List<Track>.from(
                                            record.tracks!,
                                          );
                                          tracks[0] = tracks[0]
                                            ..bpm = newBpm
                                            ..isBpmManual = true;
                                          record.tracks = tracks;

                                          await mockDatabaseService.isar
                                              .writeTxn(() async {
                                                await mockDatabaseService
                                                    .isar
                                                    .vinylRecords
                                                    .put(record);
                                              });
                                          // Trigger UI rebuild
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                          ref.invalidate(
                                            syncControllerProvider,
                                          );
                                        }
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
