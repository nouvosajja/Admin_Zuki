import 'package:admin_zuki/Pesanan/Detail/menunggu_konfirmasi.dart';
import 'package:admin_zuki/model/getorder_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pesanan_reguler extends StatefulWidget {
  const Pesanan_reguler({Key? key});

  @override
  State<Pesanan_reguler> createState() => _Pesanan_regulerState();
}

class _Pesanan_regulerState extends State<Pesanan_reguler> {
  GetOrder? getorder_api;
  bool isLoading = false;

  Future getorder() async {
    const url = 'http://zukilaundry.bardiman.com/api/filter';

    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token')!;

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        //   'Authorization': 'Bearer $token',
        // }
      );

      print('status code : ${response.statusCode}');

      if (response.statusCode == 200) {
        print(url);
        print(response.body);
        GetOrder model = GetOrder.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getorder();
    getorder().then((value) {
      setState(() {
        getorder_api = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 160),
              child: Container(
                child: Text(
                  " Menunggu Konfirmasi",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
            ),
            Container(
              height: 445,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: getorder_api?.transactions
                        ?.where((transaction) => transaction.paketId == "1")
                        .toList()
                        .length ??
                    0,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  final transaction = getorder_api!.transactions!
                      .where((transaction) => transaction.paketId == "1")
                      .toList()[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menunggu_Konfirmasi(
                            getorder: transaction,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(25, 164, 206, 1),
                      ),
                      width: 330,
                      height: 160,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 20, top: 40, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transaction.namaPaket ?? "No data",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "08 Mei 2021",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Siap diambil",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    transaction.namePrices ?? "No data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Menunggu Radit Tersayang",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

