import 'dart:convert';

class AuthenticateModel {
  final String token;
  final String refreshToken;
  final String refreshTokenExpiryTime;

  const AuthenticateModel({
    this.token = "",
    this.refreshToken = "",
    this.refreshTokenExpiryTime = "",
  });

  factory AuthenticateModel.fromRawJson(String str) =>
      AuthenticateModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory AuthenticateModel.fromJson(Map<String, dynamic> json) =>
      AuthenticateModel(
        token: json["token"] ?? "",
        refreshToken: json["refreshToken"] ?? "",
        refreshTokenExpiryTime: json["refreshTokenExpiryTime"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "refreshTokenExpiryTime": refreshTokenExpiryTime,
      };
}
