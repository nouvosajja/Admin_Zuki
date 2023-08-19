// To parse this JSON data, do
//
//     final priceModel = priceModelFromJson(jsonString);

import 'dart:convert';

List<PriceModel> priceModelFromJson(String str) =>
    List<PriceModel>.from(json.decode(str).map((x) => PriceModel.fromJson(x)));

String priceModelToJson(List<PriceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PriceModel {
  int id;
  String nama;
  String waktu;
  String paketId;
  String harga;
  String deskripsi;
  String images;
  DateTime createdAt;
  DateTime updatedAt;

  PriceModel({
    required this.id,
    required this.nama,
    required this.waktu,
    required this.paketId,
    required this.harga,
    required this.deskripsi,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        id: json["id"],
        nama: json["nama"],
        waktu: json["waktu"],
        paketId: json["paket_id"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        images: json["images"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "waktu": waktu,
        "paket_id": paketId,
        "harga": harga,
        "deskripsi": deskripsi,
        "images": images,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
