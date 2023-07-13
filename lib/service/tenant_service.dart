import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tenant_manager/service/server_info.dart';
import 'dart:convert';

import '../service_model/base_model.dart';
import '../service_model/tenant_models/tenant_model.dart';

class TenantService {
  static Future<BaseModel<List<TenantModel>>> getChargePoints(
    String token,
  ) async {
    try {
      var url = Uri.https(
        SI.serverName,
        '${SI.path}/${SI.apiN}/${SI.tenants}',
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
              json.decode(response.body)["data"].map(
                    (x) => TenantModel.fromJson(x),
                  ),
            ),
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
