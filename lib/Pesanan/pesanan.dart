import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 42, right: 160),
              child: Container(
                child: Text(
                  " Menunggu Konfirmasi",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(25, 164, 206, 1),
                ),
                width: 330, // mengatur lebar maksimal
                height: 182, // mengatur tinggi// mengatur warna background
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 240),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "08 Mei",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reguler",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Siap Diambil",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 300,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 154),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Menunggu Konfirmasi",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 220),
              child: Container(
                child: Text(
                  " Dikonfirmasi ",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(25, 164, 206, 1),
                ),
                width: 330, // mengatur lebar maksimal
                height: 182, // mengatur tinggi// mengatur warna background
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 240),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "23 Mei",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Kilat",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dalam Proses",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 300,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 220),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dikonfirmasi",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
