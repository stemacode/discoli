## ADDED Requirements

### Requirement: Background BPM and Key Extraction
The system SHALL use a background isolate to fetch BPM and Musical Key from the GetSongBPM API for any tracks currently missing this data.

#### Scenario: Newly synced tracks have null BPM
- **WHEN** the background worker finds tracks with a null BPM and `is_bpm_manual` is false
- **THEN** it throttles API calls to retrieve info and silently updates the embedded Track data in Isar.

### Requirement: Track-Level Embedded Metadata
Every `VinylRecord` SHALL store metadata at the individual Track level.

#### Scenario: Reading track data
- **WHEN** displaying the UI for a specific release
- **THEN** it shows specific BPM and Key values tied to each side/track rather than a generic value for the entire record.

### Requirement: Manual Data Override
Users SHALL be able to manually enter or edit BPM/Key data, which acts as the unchangeable source of truth.

#### Scenario: User corrects a wrong API value
- **WHEN** the user manually types a BPM and saves
- **THEN** the `is_bpm_manual` flag protects the record from being overwritten by subsequent automated syncs or background jobs.
