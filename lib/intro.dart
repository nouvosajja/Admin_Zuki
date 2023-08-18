
import 'package:admin_zuki/Home/homepage.dart';
import 'package:flutter/material.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/image/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160,),
              Image.asset('asset/image/splash 1.png'),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: const Text(
                  "Zuki Laundry",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Membuat Hidup Anda \nLebih Mudah dengan Layanan Laundry \nyang Efisien dan Terpercaya",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 180, left: 40),
        child: FloatingActionButton.extended(
          backgroundColor: const Color.fromRGBO(250, 121, 228, 1),
          label: const Text(
            "Get Started",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          extendedPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          )
        ),
      ),
    );
  }
}





