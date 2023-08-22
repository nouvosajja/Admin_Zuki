import 'package:admin_zuki/Home/homepage.dart';
import 'package:admin_zuki/Login/screen.dart';
import 'package:admin_zuki/intro.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


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
  bool hasToken = false;
  // make check token void
  void checkToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    setState(() {
      hasToken = token != null && token.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    checkToken();
    Timer(const Duration(seconds: 3), () => hasToken ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),)) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen  (),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
            ],
          ),
        ),
      );
  }
}
