import 'package:flutter/material.dart';
import 'package:zone_express/feature/Admin/couriers/widget/courier_row.dart';
import 'package:zone_express/utils/constants/font.dart';

class CourierScreen extends StatefulWidget {
  const CourierScreen({super.key});

  @override
  State<CourierScreen> createState() => _CourierScreenState();
}

class _CourierScreenState extends State<CourierScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Couriers",
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
              SizedBox(height: screenHeight * 0.04),
              Text(
                "KYC Queue",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CourierRow(
                leadingIcon: Icons.check,
                title: "KYC Queue",
                subtitle:
                    "Approve/reject couriers with reasons and annotations",
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Courier Profiles",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CourierRow(
                leadingIcon: Icons.person_2_outlined,
                title: "Courier Profiles",
                subtitle: "Documents, ratings, strike history, device info",
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Actions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CourierRow(
                leadingIcon: Icons.people_outlined,
                title: "Suspend/Ban Courier",
              ),
              SizedBox(height: screenHeight * 0.02),
              CourierRow(
                leadingIcon: Icons.directions_car_outlined,
                title: "Edit Vehicle Details",
              ),
              SizedBox(height: screenHeight * 0.02),
              CourierRow(
                leadingIcon: Icons.access_time,
                title: "Reset Online Limits/Incentives",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
