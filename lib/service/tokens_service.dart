import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tenant_manager/service/server_info.dart';
import 'dart:convert';

import '../model/service_model/base_model.dart';
import '../model/service_model/token_models/authenticate_model.dart';

class TokensService {
  static Future<BaseModel<AuthenticateModel>> getToken(
    String email,
    String password,
  ) async {
    try {
      var url = Uri.http(
        SI.serverName,
        '${SI.apiN}/${SI.tokens}',
      );
      final http.Response response = await http
          .post(
            url,
            headers: SI.header,
            body: jsonEncode(<String, dynamic>{
              "email": email,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: 60));
      switch (response.statusCode) {
        case 200:
          return BaseModel<AuthenticateModel>.fromJson(
            json: {"statusCode": 200},
            d: AuthenticateModel.fromJson(json.decode(response.body) ?? {}),
          );
        default:
          return BaseModel.fromJson(json: json.decode(response.body));
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<BaseModel<AuthenticateModel>> refreshToken(
    String token,
    String refreshToken,
  ) async {
    try {
      var url = Uri.http(
        SI.serverName,
        '${SI.apiN}/${SI.tokens}/refresh',
      );
      final http.Response response = await http
          .post(
            url,
            headers: SI.header,
            body: jsonEncode(<String, dynamic>{
              "token": token,
              "refreshToken": refreshToken,
            }),
          )
          .timeout(const Duration(seconds: 60));
      switch (response.statusCode) {
        case 200:
          return BaseModel<AuthenticateModel>.fromJson(
            json: {"statusCode": 200},
            d: AuthenticateModel.fromJson(json.decode(response.body) ?? {}),
          );
        default:
          return BaseModel.fromJson(json: json.decode(response.body));
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
