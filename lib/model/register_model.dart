// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    bool success;
    Data data;

    RegisterModel({
        required this.success,
        required this.data,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        success: json["success"],
        data: Data.fromJson(json["data"]?? ""),
    );

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
