import 'package:flutter/material.dart';
import 'package:zone_express/feature/User/orders/widget/button_row.dart';

import '../../../../utils/constants/font.dart';
import '../../dashboard/widget/dashboard_container.dart';

class FromMeScreen extends StatefulWidget {
  const FromMeScreen({super.key});

  @override
  State<FromMeScreen> createState() => _FromMeScreenState();
}

class _FromMeScreenState extends State<FromMeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ButtonRow(
            text1: "All",
            text2: "Bike/Truck",
            text3: "Courier",
            icon1: Icons.grid_view,
            icon2: Icons.map_outlined,
            icon3: Icons.local_shipping_outlined,
            onSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (selectedIndex == 0) {
                  return AllContentWidget();
                } else if (selectedIndex == 1) {
                  return CouriersContentWidget();
                } else {
                  return OthersContentWidget();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 🔹 Header Row
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "SELECT A SERVICE",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context); // or Get.back()
                                  },
                                ),
                              ],
                            ),
                          ),
                          DashCard(onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: const Text("Book Now"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.yellow[600],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// Placeholder widgets for content
class AllContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'Oops!',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'no orders found',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
      ],
    );
  }
}

class CouriersContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'Oops!',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'no orders found',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
      ],
    );
  }
}

class OthersContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'Oops!',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'no orders found',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
      ],
    );
  }
}
