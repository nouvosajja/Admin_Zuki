class GetOrder {
  List<Transactions>? transactions;

  GetOrder({this.transactions});

  GetOrder.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? id;
  String? userId;
  String? paketId;
  String? priceId;
  String? statusPesanan;
  String? berat;
  String? totalHarga;
  String? snapToken;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? namaPaket;
  String? nameUser;
  String? namePrices;
  String? hargaPrice;

  Transactions(
      {this.id,
      this.userId,
      this.paketId,
      this.priceId,
      this.statusPesanan,
      this.berat,
      this.totalHarga,
      this.snapToken,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.namaPaket,
      this.nameUser,
      this.namePrices,
      this.hargaPrice});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    paketId = json['paket_id'];
    priceId = json['price_id'];
    statusPesanan = json['status_pesanan'];
    berat = json['berat'];
    totalHarga = json['total_harga'];
    snapToken = json['snap_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namaPaket = json['nama_paket'];
    nameUser = json['name_user'];
    namePrices = json['name_prices'];
    hargaPrice = json['harga_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['paket_id'] = this.paketId;
    data['price_id'] = this.priceId;
    data['status_pesanan'] = this.statusPesanan;
    data['berat'] = this.berat;
    data['total_harga'] = this.totalHarga;
    data['snap_token'] = this.snapToken;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nama_paket'] = this.namaPaket;
    data['name_user'] = this.nameUser;
    data['name_prices'] = this.namePrices;
    data['harga_price'] = this.hargaPrice;
    return data;
  }
}
