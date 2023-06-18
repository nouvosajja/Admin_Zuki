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
                padding: EdgeInsets.only(top: 80, left: 25),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const homepage()),
                        );
                      },
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Reguler',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pesanan siap diambil',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Silahkan ambil pesanan pelanggan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masukkan Total Berat',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34, right: 34),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Total Berat',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masukkan Total Harga',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34, right: 34),
                child: Text(
                  'Total Harga: $formattedAmount',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 34, right: 34),
                child: Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const homepage()),
                      );
                    },
                    child: Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(25, 164, 206, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 140, left: 34, right: 34),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Zuki Laundry',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
