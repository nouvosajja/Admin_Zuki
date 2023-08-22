import 'package:admin_zuki/Sales/Screen/chart.dart';
import 'package:admin_zuki/Sales/Screen/chart2.dart';
import 'package:admin_zuki/Sales/Screen/chart3.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller?.addListener(_onTabChange);
  }

  void _onTabChange() {
    setState(() {});
  }

  @override
  void dispose() {
    controller?.removeListener(_onTabChange);
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40, // Increased the height to accommodate cards
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: GestureDetector(
                  
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    controller: controller,
                    tabs: [
                      CardTabItem(
                        label: '7 days',
                        onPressed: () {
                          controller?.animateTo(0);
                        },
                        isSelected: controller?.index == 0,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      CardTabItem(
                        label: '1 month',
                        onPressed: () {
                          controller?.animateTo(1);
                        },
                        isSelected: controller?.index == 1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      CardTabItem(
                        label: 'All',
                        onPressed: () {
                          controller?.animateTo(2);
                        },
                        isSelected: controller?.index == 2,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
            ),
            Expanded(
              child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),

                controller: controller,
                children:  [Chart(), Chart2(), Chart3()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTabItem extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final BorderRadius? borderRadius;

  const CardTabItem({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.borderRadius,
  });

  @override
  _CardTabItemState createState() => _CardTabItemState();
}

class _CardTabItemState extends State<CardTabItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Card(
        elevation: widget.isSelected ? 0 : 5,
        color: widget.isSelected ? Color.fromRGBO(25, 164, 206, 1) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: widget.isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
