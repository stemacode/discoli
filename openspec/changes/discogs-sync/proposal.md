## Why

DJs need their entire physical and digital music collections available on the go, enriched with metadata like BPM and musical key to plan sets effectively. Discogs is the industry standard for logging vinyl collections but lacks audio analysis data and robust tagging. Integrating Discogs synchronization enables users to keep their personalized library updated on their devices, laying the foundation for advanced metadata enrichment and filtering.

## What Changes

- Introduce Pure Client-Side OAuth 1.0a authentication to connect with the Discogs API seamlessly without a backend.
- Implement a Delta Sync mechanism to fetch the user's Discogs collection, incrementally updating a local Isar NoSQL database.
- Establish a background service to automatically enrich synced tracks with BPM and Key metadata using the GetSongBPM API.
- Provide on-demand manual overrides for missing or inaccurate metadata ensuring DJ-grade accuracy.

## Capabilities

### New Capabilities
- `discogs-auth`: Handles pure client-side OAuth 1.0a handshake, web-callbacks/deep-links, and secure token storage.
- `library-sync`: Manages the paginated, delta-sync download of the user's Discogs collection into the local Isar database.
- `metadata-enrichment`: Background and on-demand retrieval of BPM/Key from external APIs (like GetSongBPM) and manual overrides.

### Modified Capabilities

## Impact

- Adds `oauth1`, `flutter_web_auth_2` (or similar url launcher), and `flutter_secure_storage` dependencies.
- Expands the Isar database schema to include embedded Track objects within the VinylRecord collection.
- Introduces background isolates for non-blocking metadata enrichment.
