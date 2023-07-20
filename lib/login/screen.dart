import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_zuki/model/login_model.dart';
import 'package:admin_zuki/model/register_model.dart';
import 'package:admin_zuki/Home/homepage.dart';
import 'package:http/http.dart' as http;

import '../widget/new.form.global.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginscreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController ctremail = new TextEditingController();
  TextEditingController ctrpassword = new TextEditingController();

//   postData() async {
//     if (ctremail.text.isNotEmpty && ctrpassword.text.isNotEmpty) {
//       var response = await http
//           .post(Uri.parse("http://zukilaundry.bardiman.com/api/login"), body: {
//         "email": "${ctremail.text}",
//         "password": "${ctrpassword.text}"
//       });
//       print("Status Code : ${response.statusCode}");
//       print(response.body);
//
//       if (response.statusCode == 200) {
//         LoginModel user = loginModelFromJson(response.body);
//         SharedPreferences pref = await SharedPreferences.getInstance();
//         pref.setString('token', user.data.token);
//         Navigator.pushNamed(context, homepage.routeName);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Email atau Password tidak valid")));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Isi Semua Kolom dengan benar")));
//     }
//   }

  bool loadingBallAppear = false;

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: loadingBallAppear
                ? const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 30.0),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/wp.png'),
                            const SizedBox(height: 45),
                            const Text(
                              "Masuk",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        /// Email Input
                        TextFormGlobal(
                            controller: ctremail,
                            text: 'Email',
                            textInputType: TextInputType.emailAddress,
                            obscure: false),

                        /// Password Input
                        TextFormGlobal(
                            controller: ctrpassword,
                            text: 'Password',
                            textInputType: TextInputType.text,
                            obscure: true),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                // postData();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const homepage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(0, 163, 255, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Belum punya akun?',
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              InkWell(
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>()),
                                //   );
                                // },
                              ),
                            ],
                          ),
                        )
                      ],
                    )))),
      ),
    );
  }
}
