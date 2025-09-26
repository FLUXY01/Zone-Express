import 'package:flutter/material.dart';
import 'package:zone_express/feature/User/orders/screens/to_me_screen.dart';
import 'package:zone_express/feature/User/orders/screens/from_me_screen.dart'; // Create this if needed
import 'package:zone_express/feature/User/orders/widget/tab_button.dart';
import 'package:zone_express/utils/constants/font.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Divider(height: 1, color: Colors.grey[300]),
          Row(
            children: [
              TabButton(
                text: "To Me",
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              TabButton(
                text: "From Me",
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(child: selectedIndex == 0 ? ToMeScreen() : FromMeScreen()),
        ],
      ),
    );
  }
}
