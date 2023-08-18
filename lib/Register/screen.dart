import 'package:admin_zuki/widgets/text.form.global.dart';
import 'package:flutter/material.dart';
import 'package:admin_zuki/Login/screen.dart';
import 'package:admin_zuki/Register/continue.dart';

class RegisterScreen extends StatefulWidget {
   static String routeName = "/registerscreen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
TextEditingController ctrusername = new TextEditingController();
  TextEditingController ctremail = new TextEditingController();
  TextEditingController ctrpassword = new TextEditingController();




  
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30.0),
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
                                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          
                        
                        const SizedBox(height: 30),
                        /// Name Input
                        TextFormGlobal(
                          controller: ctrusername, 
                          text: 'Name', 
                          textInputType: TextInputType.emailAddress, 
                          obscure: false
                          ),
                        /// Email Input
                        TextFormGlobal(
                          controller: ctremail, 
                          text: 'Email', 
                          textInputType: TextInputType.emailAddress, 
                          obscure: false
                          ),
                        /// Password Input
                        TextFormGlobal(
                          controller: ctrpassword, 
                          text: 'Password', 
                          textInputType: TextInputType.text, 
                          obscure: true
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Container(
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  // postData();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  ContinueScreen(name: ctrusername.text, email: ctremail.text, password: ctrpassword.text,)),
                                  );
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(0, 163, 255, 1),
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
                        )
                      ],
                    )
            )
          )
        ),
      ),
    );
  }
}