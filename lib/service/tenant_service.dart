import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tenant_manager/service/server_info.dart';
import 'dart:convert';

import '../model/service_model/base_model.dart';
import '../model/service_model/tenant_models/tenant_model.dart';

class TenantService {
  //servislerde bu aşamada http url kullanılsın.
  //Bu güvensiz bir protokoldür. Bu yüzden http kullanılmamalıdır.
  //Ancak kendi bilgisayarımıza bağlanmamızdan bu durum önem arz etmez.

  static Future<BaseModel<String>> createTenant(String token, String tenantId,
      String name, String adminEmail, String issuer) async {
    try {
      var url = Uri.http(SI.serverName, '${SI.apiN}/${SI.tenants}');

      final http.Response response = await http
          .post(
            url,
            headers: SI.authHeader(token),
            body: jsonEncode(<String, dynamic>{
              "id": tenantId,
              "name": name,
              "connectionString": "",
              "adminEmail": adminEmail,
              "issuer": issuer
            }),
          )
          .timeout(const Duration(seconds: 60));

      switch (response.statusCode) {
        case 200:
          return BaseModel<String>.fromJson(
            json: {"statusCode": 200},
            d: response.body,
          );
        default:
          return BaseModel.fromJson(
            json: json.decode(response.body),
          );
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Base Model içinde bir liste döndürür. Bu liste içinde de Tenant yani şirketler bulunmaktadır.
  static Future<BaseModel<List<TenantModel>>> getTenants(
    String token,
  ) async {
    try {
      var url = Uri.http(
        SI.serverName,
        '${SI.apiN}/${SI.tenants}',
      );
      final http.Response response = await http
          .get(
            url,
            headers: SI.authHeader(token),
          )
          .timeout(const Duration(seconds: 60));
      switch (response.statusCode) {
        case 200:
          return BaseModel<List<TenantModel>>.fromJson(
            json: {"statusCode": 200},
            d: List<TenantModel>.from(
              json.decode(response.body).map(
                    (x) => TenantModel.fromJson(x),
                  ),
            ),
          );
        default:
          return BaseModel.fromJson(
            json: json.decode(response.body),
          );
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<BaseModel<String>> getTenantsActivation(
      String tenantId, String token, bool active) async {
    try {
      var url = Uri.http(SI.serverName,
          '${SI.apiN}/${SI.tenants}/$tenantId/${active ? "deactivate" : "activate"}');
      final http.Response response = await http
          .post(
            url,
            headers: SI.authHeader(token),
          )
          .timeout(const Duration(seconds: 60));
      switch (response.statusCode) {
        case 200:
          return BaseModel<String>.fromJson(
            json: {"statusCode": 200},
            d: response.body,
          );
        default:
          return BaseModel.fromJson(
            json: json.decode(response.body),
          );
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<BaseModel<String>> updateTenantSubscription(
      String token, String tenantId, DateTime extendedExpiryDate) async {
    try {
      var url =
          Uri.http(SI.serverName, '${SI.apiN}/${SI.tenants}/$tenantId/upgrade');
      final http.Response response = await http
          .post(
            url,
            headers: SI.authHeader(token),
            body: jsonEncode(<String, dynamic>{
              "tenantId": tenantId,
              "extendedExpiryDate": extendedExpiryDate.toIso8601String(),
            }),
          )
          .timeout(const Duration(seconds: 60));
      print(response.body);
      switch (response.statusCode) {
        case 200:
          return BaseModel<String>.fromJson(
            json: {"statusCode": 200},
            d: response.body,
          );
        default:
          return BaseModel.fromJson(
            json: json.decode(response.body),
          );
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      print("tenant service e.toString() : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
