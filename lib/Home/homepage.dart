import 'package:admin_zuki/tabbar.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54, left: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 4, color: Color.fromRGBO(25, 164, 206, 1))
                      ),
                        child: Image.asset("assets/images/profile.png"),
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(2),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Guest",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(25, 164, 206, 1))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 64,),
            Expanded(child: Tabbar())
          ],
        ),
      ),
    );
  }
}