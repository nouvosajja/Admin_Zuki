import 'package:admin_zuki/Screen/chat.dart';
import 'package:admin_zuki/Pesanan/pesanan.dart';
import 'package:admin_zuki/riwayat.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar>with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 50,
              width: 340,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  controller: controller,
                  tabs: [
                  Container(
                    height: 50,
                    child: 
                  Center(child: Text('Pesanan', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),))), 
                  Container(
                    height: 50,
                    child: 
                  Center(child: Text('Chat', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),))), 
                  Container(
                    height: 50,
                    child: 
                  Center(child: Text('Riwayat', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),))),],
                ),
                automaticallyImplyLeading: false,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
              Pesanan(),
              Chat(),
              Riwayat()
            ], ))
          ],)
    );
  }
}