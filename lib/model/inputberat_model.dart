// To parse this JSON data, do
//
//     final inputBeratModel = inputBeratModelFromJson(jsonString);

import 'dart:convert';

InputBeratModel inputBeratModelFromJson(String str) => InputBeratModel.fromJson(json.decode(str));

String inputBeratModelToJson(InputBeratModel data) => json.encode(data.toJson());

class InputBeratModel {
    bool success;
    String message;
    Data data;

    InputBeratModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory InputBeratModel.fromJson(Map<String, dynamic> json) => InputBeratModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String userId;
    String paketId;
    String priceId;
    String statusPesanan;
    String berat;
    String totalHarga;
    String snapToken;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.paketId,
        required this.priceId,
        required this.statusPesanan,
        required this.berat,
        required this.totalHarga,
        required this.snapToken,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        paketId: json["paket_id"],
        priceId: json["price_id"],
        statusPesanan: json["status_pesanan"],
        berat: json["berat"],
        totalHarga: json["total_harga"],
        snapToken: json["snap_token"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "paket_id": paketId,
        "price_id": priceId,
        "status_pesanan": statusPesanan,
        "berat": berat,
        "total_harga": totalHarga,
        "snap_token": snapToken,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
