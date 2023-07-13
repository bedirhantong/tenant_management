import 'dart:convert';

class TenantModel {
  String? id;
  String? name;
  String? connectionString;
  String? adminEmail;
  bool? isActive;
  String? validUpto;
  String? issuer;

  TenantModel({
    this.id = "",
    this.name = "",
    this.connectionString = "",
    this.adminEmail = "",
    this.isActive = false,
    this.validUpto = "",
    this.issuer = "",
  });

  factory TenantModel.fromRawJson(String str) =>
      TenantModel.fromJson(json.decode(str));

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        connectionString: json["connectionString"] ?? "",
        adminEmail: json["adminEmail"] ?? "",
        isActive: json["isActive"] ?? false,
        validUpto: json["validUpto"] ?? "",
        issuer: json["issuer"] ?? "",
      );
}
