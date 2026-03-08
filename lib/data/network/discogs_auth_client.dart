import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:oauth1/oauth1.dart' as oauth1;
import '../local/secure_storage_service.dart';

// A mock inner client that just intercepts the request and throws it back
class _MockHttpClient extends http.BaseClient {
  http.BaseRequest? capturedRequest;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    capturedRequest = request;
    throw Exception('Mock client should not actually send requests');
  }
}

class OAuth1Interceptor extends Interceptor {
  final SecureStorageService secureStorage;

  OAuth1Interceptor(this.secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final consumerKey = await secureStorage.getConsumerKey();
    final consumerSecret = await secureStorage.getConsumerSecret();
    final accessToken = await secureStorage.getAccessToken();
    final accessTokenSecret = await secureStorage.getAccessTokenSecret();

    if (consumerKey == null ||
        consumerSecret == null ||
        accessToken == null ||
        accessTokenSecret == null) {
      // Missing credentials, let it pass (it will likely fail on the server if required)
      return handler.next(options);
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

    final credentials = oauth1.Credentials(accessToken, accessTokenSecret);

    final mockInnerClient = _MockHttpClient();
    final oauthClient = oauth1.Client(
      platform.signatureMethod,
      clientCredentials,
      credentials,
      mockInnerClient,
    );

    // Create an http.Request to sign
    final httpRequest = http.Request(options.method, options.uri);

    // Give it the body if available
    if (options.data != null) {
      httpRequest.body = options.data.toString();
    }

    // Try to send it through the oauthClient, which will just sign it and pass it to our mock
    try {
      await oauthClient.send(httpRequest);
    } catch (_) {
      // It's expected to throw the mock exception
    }

    // The mockInnerClient now has the signed capturedRequest
    final signedRequest = mockInnerClient.capturedRequest;
    if (signedRequest != null) {
      final authHeader = signedRequest.headers['Authorization'];
      if (authHeader != null) {
        options.headers['Authorization'] = authHeader;
      }
    }

    // Discogs also requires a generic User-Agent for all requests
    options.headers['User-Agent'] = 'Discofy/1.0.0 +https://discofy.app';

    super.onRequest(options, handler);
  }
}

class DiscogsAuthClient {
  final SecureStorageService secureStorage;
  late final Dio dio;

  DiscogsAuthClient(this.secureStorage) {
    dio = Dio(BaseOptions(baseUrl: 'https://api.discogs.com'));
    dio.interceptors.add(OAuth1Interceptor(secureStorage));
  }
}
