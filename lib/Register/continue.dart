import 'package:admin_zuki/widgets/text.form.global.dart';
import 'package:admin_zuki/kebijakanPrivasi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_zuki/Login/screen.dart';
import 'package:admin_zuki/model/register_model.dart';
import 'package:http/http.dart' as http;



class ContinueScreen extends StatefulWidget {
  const ContinueScreen({Key? key, required this.name, required  this.email, required  this.password}) : super(key: key);
  final String name, email, password;
  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  registerData() async {
    if (widget.name.isNotEmpty &&
        widget.email.isNotEmpty &&
        widget.password.isNotEmpty &&
        numberController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("http://zukilaundry.bardiman.com/api/register"), body: {
        "email": "${widget.email}",
        "name": "${widget.name}",
        "password": "${widget.password}",
        "number": "${numberController.text}",
        "address": "${addressController.text}"
      });
      print("Status Code : ${response.statusCode}");
      print(response.body);

      if (response.statusCode == 200) {
               RegisterModel user = registerModelFromJson(response.body);

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', user.data.token);
        //pindah page
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Email Sudah Terdaftar")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Isi Semua Kolom dengan benar")));
    }
  }

  bool loadingBallAppear = false;

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
                              Image.asset('asset/image/wp.png'),
                              const SizedBox(height: 45),
                              const Text(
                                "Daftar",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          /// Name Input
                          TextFormGlobal(
                              controller: numberController,
                              text: 'Nomer Hp',
                              textInputType: TextInputType.emailAddress,
                              obscure: false),

                          /// Email Input
                          TextFormGlobal(
                              controller: addressController,
                              text: 'Alamat',
                              textInputType: TextInputType.emailAddress,
                              obscure: false),

                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 50,
                            ),
                            child: Container(
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  registerData();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const bottom_nav()),
                                  // );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(0, 163, 255, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                                'Sudah punya akun?',
                              ),
                              const SizedBox(width: 2.5,),
                              InkWell(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginScreen()
                                    ),
                                 );
                                },
                              ),
                            ],
                          ),
                        ),

                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Dengan melanjutkan, anda menyetujui',
                                ),
                                InkWell(
                                  child: const Text(
                                    'Kebijakan Privasi',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const kebijakan()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ))),
    );
  }
}
