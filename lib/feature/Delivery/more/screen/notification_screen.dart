import 'package:flutter/material.dart';
import 'package:zone_express/feature/Delivery/more/widget/notification_row.dart';

import '../../../../utils/constants/font.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Jobs",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.inventory_2_rounded,
                title: "New Delivery Request",
                trailingIcon: Icons.arrow_forward,
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.inventory_2_rounded,
                title: "Delivery request cancelled",
                trailingIcon: Icons.arrow_forward,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Earnings",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.attach_money_outlined,
                title: "Payment received",
                trailingIcon: Icons.arrow_forward,
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.attach_money_outlined,
                title: "Bonus earned",
                trailingIcon: Icons.arrow_forward,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "System",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.notifications,
                title: "New feature available",
                trailingIcon: Icons.arrow_forward,
              ),
              SizedBox(height: screenHeight * 0.03),
              NotificationRow(
                leadingIcon: Icons.notifications,
                title: "App update available",
                trailingIcon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
