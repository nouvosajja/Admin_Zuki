import 'dart:convert';
import 'package:admin_zuki/model/getorder_model.dart';
import 'package:admin_zuki/model/price_model.dart';
import 'package:flutter/material.dart';
import 'package:admin_zuki/Home/homepage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Menunggu_Konfirmasi extends StatefulWidget {
  Menunggu_Konfirmasi({Key? key, required this.getorder}) : super(key: key);
  Transactions getorder;

  @override
  State<Menunggu_Konfirmasi> createState() => _MenungguKonfirmasiState();
}

class _MenungguKonfirmasiState extends State<Menunggu_Konfirmasi> {
  TextEditingController weightController = TextEditingController();
  double totalPrice = 0.0;
  String formattedAmount = '';
  
  void calculateTotalPrice() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    int pricePerKg =int.parse(widget.getorder.hargaPrice!); // Initialize with default price per kilogram

    
  
    setState(() {
      totalPrice = weight * pricePerKg;
      formattedAmount = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(totalPrice);
    });
  }

   Future getorder() async {
    const url = 'http://zukilaundry.bardiman.com/api/filter';

    print('-----------user-------------');

    //call token from set pref
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token')!;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('token : $token');
      print('status code : ${response.statusCode}');

      if (response.statusCode == 200) {
        print(url);
        print(response.body);
        GetOrder model =
            GetOrder.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }


   Future<void> postData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";
    Future.delayed(Duration(seconds: 3), () async {
      final url = Uri.parse("http://zukilaundry.bardiman.com/api/input-berat/${widget.getorder.id}");
      // Create the request body
      final Map<String, dynamic> requestBody = {
        "berat": weightController.text,
        "total_harga": formattedAmount,
        // Add more fields as necessary
      };

      final requestHeader = {
        'Authorization': 'Bearer ${token}',
      };

      // Make the POST request
      final response =
          await http.post(url, body: requestBody, headers: requestHeader);

      // Handle the response
      if (response.statusCode == 200) {
        print('POST Data Transaction request was successful.');
        print('Response: ${requestBody}');
        // x
      } else {
        print('POST Data Transaction request failed.');
        print('Status code: ${response.statusCode}');
      }
    });
    // Define the API endpoint URL
  }

  @override
  Widget build(BuildContext context) {
    weightController.addListener(calculateTotalPrice);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 25),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 10),
                     Text(
                      "Detail Pesanan",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pesanan siap diambil',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Silahkan ambil pesanan pelanggan',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masukkan Total Berat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 34, right: 34),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Total Berat',
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masukkan Total Harga',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 34, right: 34),
                child: Text(
                  'Total Harga: $formattedAmount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 34, right: 34),
                child: Container(
                  height: 50,
                  width: 179,
                  child: ElevatedButton(
                    onPressed: () {
                      postData();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const HomePage()),
                      // );
                    },
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(25, 164, 206, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
