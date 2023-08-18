import 'package:admin_zuki/intro.dart';
import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  runApp(const MaterialApp(
    home: intro_anim(),
  ));
}

class intro_anim extends StatefulWidget {
  const intro_anim({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<intro_anim> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const intro()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/splash 1.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 5),
            const Text(
              'Zuki Laundry',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
