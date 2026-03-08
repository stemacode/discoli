import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import '../local/secure_storage_service.dart';

class DiscogsAuthFlow {
  final SecureStorageService secureStorage;
  static const String _callbackUrlScheme = 'discofy';

  DiscogsAuthFlow(this.secureStorage);

  Future<void> authorize() async {
    final consumerKey = await secureStorage.getConsumerKey();
    final consumerSecret = await secureStorage.getConsumerSecret();

    if (consumerKey == null || consumerSecret == null) {
      throw Exception(
        'Consumer Key and Secret must be configured in secure storage.',
      );
    }

    final platform = oauth1.Platform(
      'https://api.discogs.com/oauth/request_token',
      'https://api.discogs.com/oauth/authorize',
      'https://api.discogs.com/oauth/access_token',
      oauth1.SignatureMethods.hmacSha1,
    );

    final clientCredentials = oauth1.ClientCredentials(
      consumerKey,
      consumerSecret,
    );

    final authDetails = oauth1.Authorization(clientCredentials, platform);

    // 1. Get Request Token
    final requestTokenResponse = await authDetails.requestTemporaryCredentials(
      '$_callbackUrlScheme://auth-callback',
    );
    final requestToken = requestTokenResponse.credentials;

    // 2. Build Authorization URL
    final authUrl = authDetails.getResourceOwnerAuthorizationURI(
      requestToken.token,
    );

    // 3. Open browser for user authentication
    final result = await FlutterWebAuth2.authenticate(
      url: authUrl,
      callbackUrlScheme: _callbackUrlScheme,
    );

    // 4. Extract token and verifier from the callback URL
    final uri = Uri.parse(result);
    final oauthToken = uri.queryParameters['oauth_token'];
    final oauthVerifier = uri.queryParameters['oauth_verifier'];

    if (oauthToken == null || oauthVerifier == null) {
      throw Exception('OAuth Token or Verifier missing from callback URL.');
    }

    // 5. Exchange for Access Token
    final accessTokenResponse = await authDetails.requestTokenCredentials(
      requestToken,
      oauthVerifier,
    );
    final accessTokenData = accessTokenResponse.credentials;

    // 6. Save Access Tokens securely
    await secureStorage.saveAccessTokens(
      token: accessTokenData.token,
      secret: accessTokenData.tokenSecret,
    );
  }
}
