import 'package:flutter/material.dart';
import 'package:admin_zuki/login/screen.dart';
import 'package:admin_zuki/Home/homepage.dart';

final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) => const HomePage(),
    LoginScreen.routeName: (context) => const LoginScreen(),
};
