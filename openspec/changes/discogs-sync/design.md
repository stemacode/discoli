## Context

Discofy is a Flutter PWA designed for DJs. It needs to sync the user's Discogs library into a local database so they can use it for planning DJ sets. The user needs to authenticate with Discogs (OAuth 1.0a) entirely without a backend server, download the collection, and incrementally update it later (Delta Sync). The records then need to be enriched with BPM/Key data.

## Goals / Non-Goals

**Goals:**
- Enable 100% client-side Discogs OAuth 1.0a authentication across Web (PWA), iOS, and Android.
- Create a performant Delta Sync to pull Discogs collection into Isar NoSQL format and stream progress to the Riverpod UI.
- Establish an embedded `Track` data model within Isar's `VinylRecord`.
- Implement background fetching for BPM and Musical Key from an external API (like GetSongBPM).

**Non-Goals:**
- Complex Delta sync diffing (we will only fetch newly added items, rather than deep scanning for removed or externally modified items).
- Setting up a backend or API proxy server.
- Relying on the deprecated Spotify Audio Features API.

## Decisions

- **Pure Client-Side OAuth 1.0a**: We chose to implement the OAuth handshake directly in Flutter using packages like `oauth1`, `flutter_web_auth_2` (or URL Link handling), and `flutter_secure_storage`. Rationale: Prevents server cost/maintenance, stays true to the local-first setup.
- **Delta Sync + Paginator Stream**: The sync fetches pages sorted by `added` (descending). It stops iterating pages when it encounters a `discogs_id` already present in the Isar DB. The sync yields a stream to update the Riverpod UI in real-time. Rationale: Optimal performance on returning sessions and avoids freezing the UI with a long-running loading state.
- **Embedded Tracks in Isar**: A `VinylRecord` handles a `List<Track>` so each side of a vinyl record can have individual BPM and Key values. Includes `is_bpm_manual` tracking to prevent background workers from overwriting user-sourced edits. Rationale: Isar embeds handle lists efficiently, keeping DJ-level metadata attached to the specific track of a release.
- **Background Isolate for Enrichment**: A background worker scans the local DB for missing BPMs (`bpm == null && !is_bpm_manual`) and slowly calls the GetSongBPM API to avoid UI locking. Manual overrides act as the final, untouchable authority. Rationale: Graceful degradation where slow networks or API rate limits do not block the user.

## Risks / Trade-offs

- [Risk] PWA OAuth 1.0a Redirection State Loss -> Mitigation: Keep state minimal during redirect and rely on URL parameters properly caught on app resume.
- [Risk] API Secret Exposure -> Mitigation: Keep secrets in securely compiled dart defines; acknowledge that a pure client OAuth implies some risk but is acceptable for a personal utility integration.
- [Risk] Rate Limits on GetSongBPM API -> Mitigation: Use isolates to throttle enrichment requests and prioritize manual entry.
