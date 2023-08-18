import 'package:flutter/material.dart';
import 'package:admin_zuki/Home/homepage.dart';
import 'package:intl/intl.dart';

class Menunggu_Konfirmasi extends StatefulWidget {
  const Menunggu_Konfirmasi({Key? key}) : super(key: key);

  @override
  State<Menunggu_Konfirmasi> createState() => _MenungguKonfirmasiState();
}

class _MenungguKonfirmasiState extends State<Menunggu_Konfirmasi> {
  TextEditingController weightController = TextEditingController();
  double totalPrice = 0.0;
  String formattedAmount = '';

  void calculateTotalPrice() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double pricePerKg = 12000.0; // Fixed price per kilogram
    
    setState(() {
      totalPrice = weight * pricePerKg;
      formattedAmount = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(totalPrice);
    });
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
                    const Text(
                      'Reguler',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
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
