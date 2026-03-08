## ADDED Requirements

### Requirement: OAuth 1.0a Client-Side Handshake
The app SHALL complete the Discogs OAuth 1.0a handshake entirely client-side.

#### Scenario: User authorizes app
- **WHEN** user taps "Connect Discogs"
- **THEN** app opens a browser for authentication and captures the callback URL containing `oauth_verifier`.

### Requirement: Secure Credentials Storage
The app SHALL store the resulting Access Token and Access Token Secret securely on the device.

#### Scenario: Successful token retrieval
- **WHEN** callback returns the verifier and access token is fetched
- **THEN** token credentials are saved to local secure storage and attached via interceptor to all further API calls.
