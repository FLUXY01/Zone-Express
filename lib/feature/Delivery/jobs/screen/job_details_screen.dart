import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/Delivery/dashboard/screens/dashboard_delivery.dart';
import 'package:zone_express/feature/Delivery/jobs/screen/pickup_details_screen.dart';
import 'package:zone_express/feature/Delivery/jobs/widget/fare_row.dart';
import 'package:zone_express/feature/Delivery/main_screen_delivery.dart';

import '../../../../utils/constants/font.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Job Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
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
                "Fare Breakdown",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Color(0xFF9E8F47), thickness: 1),
              SizedBox(height: screenHeight * 0.03),
              FareRow(label: "Base fare", value: "\$5.00"),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Color(0xFF9E8F47), thickness: 1),
              SizedBox(height: screenHeight * 0.03),
              FareRow(label: "Distance Fare(per Km)", value: "\$2.00"),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Color(0xFF9E8F47), thickness: 1),
              SizedBox(height: screenHeight * 0.03),
              FareRow(label: "Surge", value: "\$1.00"),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Color(0xFF9E8F47), thickness: 1),
              SizedBox(height: screenHeight * 0.03),
              FareRow(label: "Tips", value: "\$1.50"),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Color(0xFF9E8F47), thickness: 1),
              SizedBox(height: screenHeight * 0.05),
              FareRow(label: "Total Fare", value: "\$10.0"),
              SizedBox(height: screenHeight * 0.06),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: CommonButtonGrey(
                      label: "Decline",
                      onPressed: () {
                        Get.to(() => MainScreenDelivery());
                      },
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: CommonButtonYellow(
                      label: "Accept",
                      onPressed: () {
                        Get.to(() => PickupDetailsScreen());
                      },
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
