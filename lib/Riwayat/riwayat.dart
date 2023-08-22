import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(25, 164, 206, 1),
                ),
                width: 330, // mengatur lebar maksimal
                height: 195, // mengatur tinggi// mengatur warna background
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                      padding: EdgeInsets.only(top: 20,left: 20),
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
                          padding: EdgeInsets.only(top: 10,left: 100),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Rp 36.000",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10,left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "3 kg",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5,left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Siap Diambil",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                   const Padding(
                    padding: EdgeInsets.only(top: 5,left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "08 Mei",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                  ), 
                  //make line
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: Container(
                      width: 292,
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 160),
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
          )
        ],
      ),

    );
  }
}
