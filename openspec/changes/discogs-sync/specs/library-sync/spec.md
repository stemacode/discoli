## ADDED Requirements

### Requirement: Paginator Delta Sync
The system SHALL incrementally download the user's Discogs collection by fetching items sorted by newest added and stopping when reaching a known `discogs_id`.

#### Scenario: Running sync for returning user
- **WHEN** the sync begins for a user with existing records in the database
- **THEN** it fetches pages and stops parsing as soon as a `discogs_id` already present in Isar is encountered.

### Requirement: Stream Real-Time UI Feedback
The sync progress SHALL stream updates to the Riverpod controller to reflect immediate state changes in the UI.

#### Scenario: Syncing a large collection
- **WHEN** multiple pages of records are being fetched and processed
- **THEN** the UI updates continuously with the count of imported items instead of freezing on a single loading spinner.
