## 1. OAuth Setup and Client Setup

- [ ] 1.1 Add `oauth1`, `flutter_web_auth_2` (or `url_launcher`), and `flutter_secure_storage` to `pubspec.yaml`
- [ ] 1.2 Implement secure storage service to manage OAuth credentials (Consumer Key/Secret, Access Token/Secret)
- [ ] 1.3 Implement Discogs Auth Client capable of signing requests via an `OAuth1Interceptor`
- [ ] 1.4 Construct user authorization flow bridging request tokens to browser auth callback

## 2. Isar Database and Embedded Models

- [ ] 2.1 Add `isar`, `isar_flutter_libs` to dependencies
- [ ] 2.2 Define `VinylRecord` Isar Collection data class
- [ ] 2.3 Define `Track` embedded Isar object data class (including `bpm`, `key`, `is_bpm_manual`, `is_key_manual`)
- [ ] 2.4 Initialize Isar instance handling browser-indexed storage constraints in `main.dart` or via a provider
- [ ] 2.5 Generate Isar builder files (`build_runner`)

## 3. Discogs Sync Service

- [ ] 3.1 Implement API mapping to convert Discogs Collection JSON payloads into `VinylRecord` objects
- [ ] 3.2 Implement Delta Sync pagination logic (Fetch pages, stop when known `discogs_id` is found)
- [ ] 3.3 Create a Riverpod Sync Controller generating a Stream of `SyncProgress` integers to the UI
- [ ] 3.4 Wire the syncing controller to an empty "Sync Now" button on the UI

## 4. Metadata Enrichment and Overrides

- [ ] 4.1 Create background worker/isolate skeleton for asynchronous Isar querying
- [ ] 4.2 Integrate GetSongBPM API client (or similar) to fetch string-matched BPM data
- [ ] 4.3 Configure background worker to only update `bpm/key` on `Track`s where `is_bpm_manual` is false
- [ ] 4.4 Add UI interaction allowing manual override of BPM, saving the track with `is_bpm_manual = true`
