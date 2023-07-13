import 'dart:io';

class SI {
  static String serverName = "localhost:5100";
  static String path = "pathTest";
  static String apiN = "api";
  static String tenants = "tenants";
  static String account = "tokens";

  static Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'tenant': 'root',
  };

  static Map<String, String> authHeader(String token) {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
      'tenant': 'root',
    };
  }
}
