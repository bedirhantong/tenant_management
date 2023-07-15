import 'dart:io';

class SI {
  static String serverName = "localhost:5010";
  static String apiN = "api";
  static String tenants = "tenants";
  static String tokens = "tokens";

  //tokens servisinde ve token istemeyen servislerde bu kullanlınır.
  static Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'tenant': 'root',
  };

  //tenant ve diğer servislerde bu header kullanılacak
  static Map<String, String> authHeader(String token) {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
      'tenant': 'root',
    };
  }
}
