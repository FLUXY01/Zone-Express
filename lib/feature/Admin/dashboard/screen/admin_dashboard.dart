import 'package:flutter/material.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/User/dashboard/widget/stat_card.dart';

import '../../../../utils/constants/font.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Overview",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  Expanded(
                    child: StatCard(title: "On-time Delivery", value: "95%"),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: StatCard(title: "Avg. ETA", value: "25 min"),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: StatCard(title: "Cancellation Rate", value: "2%"),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: StatCard(title: "Earnings", value: "\$ 12,500"),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                child: StatCard(title: "Customer Satisfaction", value: "4.8/5"),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: CommonButtonYellow(
                      label: "New Zone",
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: CommonButtonGrey(
                      label: "Promo Code",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
