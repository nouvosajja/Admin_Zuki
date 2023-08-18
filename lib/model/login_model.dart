// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool success;
    Data data;

    LoginModel({
        required this.success,
        required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) {
  return LoginModel(
    success: json["success"] ?? false,
    data: json["data"] != null ? Data.fromJson(json["data"]) : Data(token: "", name: ""),
  );
}


    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    String name;

    Data({
        required this.token,
        required this.name,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
    };
}
