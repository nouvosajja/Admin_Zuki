import 'dart:convert';
import 'package:admin_zuki/Login/screen.dart';
import 'package:admin_zuki/Pesanan/pesanan.dart';
import 'package:http/http.dart' as http;
import 'package:admin_zuki/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/homepage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = false;

  UserModel? profil_api;

  @override
  void initState() {
    getprofil();
    getprofil().then((value) {
      setState(() {
        profil_api = value;
      });
    });
    super.initState();
  }

  Future getprofil() async {
    final url = 'http://zukilaundry.bardiman.com/api/user';

    print('-----------user-------------');

    //call token from set pref
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token')!;

    print('token : $token');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('token : $token');
      print('status code : ${response.statusCode}');

      if (response.statusCode == 200) {
        print(url);

        UserModel model = UserModel.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (profil_api?.name == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(25, 164, 206, 1),
                  ),
                  width: 360,
                  height: 124,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello, ' + (profil_api?.name ?? 'Data tidak ada'),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "Poppins"
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(right: 15, bottom: 30),
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("token");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.logout_rounded,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: Pesanan())
          ],
        ),
      ),
    );
  }
}
