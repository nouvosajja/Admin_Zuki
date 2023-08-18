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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Kilat',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
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
                    'Silahkan selesaikan proses pesanan',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Berat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: beratController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Total Berat',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Harga',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Total Harga',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Status Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 34, right: 34),
                child: TextField(
                  controller: statusController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Isi...',
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
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      'Selesai',
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
