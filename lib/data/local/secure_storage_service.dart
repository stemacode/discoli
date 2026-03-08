import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  // Keys
  static const String _keyConsumerKey = 'BXAwgzqSXtjIMVBPqfyt';
  static const String _keyConsumerSecret = 'TmoMTJNzQaVpAZdmIemTPpEMhjdfyCuJ';
  static const String _keyAccessToken = 'discogs_access_token';
  static const String _keyAccessTokenSecret = 'discogs_access_token_secret';

  // --- Consumer Credentials ---
  Future<void> saveConsumerCredentials({
    required String consumerKey,
    required String consumerSecret,
  }) async {
    await _storage.write(key: _keyConsumerKey, value: consumerKey);
    await _storage.write(key: _keyConsumerSecret, value: consumerSecret);
  }

  Future<String?> getConsumerKey() async {
    return await _storage.read(key: _keyConsumerKey);
  }

  Future<String?> getConsumerSecret() async {
    return await _storage.read(key: _keyConsumerSecret);
  }

  // --- Access Tokens ---
  Future<void> saveAccessTokens({
    required String token,
    required String secret,
  }) async {
    await _storage.write(key: _keyAccessToken, value: token);
    await _storage.write(key: _keyAccessTokenSecret, value: secret);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  Future<String?> getAccessTokenSecret() async {
    return await _storage.read(key: _keyAccessTokenSecret);
  }

  // --- Utility ---
  Future<void> clearAll() async {
    await _storage.delete(key: _keyConsumerKey);
    await _storage.delete(key: _keyConsumerSecret);
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyAccessTokenSecret);
  }

  Future<bool> hasAccessToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
