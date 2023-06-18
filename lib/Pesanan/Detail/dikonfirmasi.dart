import 'package:admin_zuki/Home/homepage.dart';
import 'package:flutter/material.dart';

class Dikonfirmasi extends StatefulWidget {
  const Dikonfirmasi({super.key});

  @override
  State<Dikonfirmasi> createState() => _DikonfirmasiState();
}

class _DikonfirmasiState extends State<Dikonfirmasi> {
  TextEditingController beratController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          MaterialPageRoute(
                              builder: (context) => const homepage()),
                        );
                      },
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Kilat',
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
                    'Silahkan selesaikan proses pesanan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Berat',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: beratController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total Berat',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Harga',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total Harga',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Status Pembayaran',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: statusController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Isi...',
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
                        MaterialPageRoute(
                            builder: (context) => const homepage()),
                      );
                    },
                    child: Text(
                      'Selesai',
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
                padding: EdgeInsets.only(top: 40, left: 34, right: 34),
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
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
