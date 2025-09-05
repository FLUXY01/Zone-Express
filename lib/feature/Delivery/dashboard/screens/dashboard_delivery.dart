import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/User/dashboard/widget/stat_card.dart';
import 'package:zone_express/utils/constants/font.dart';

import '../../../../utils/constants/images.dart';

class DashboardScreenDelivery extends StatefulWidget {
  const DashboardScreenDelivery({super.key});

  @override
  State<DashboardScreenDelivery> createState() =>
      _DashboardScreenDeliveryState();
}

class _DashboardScreenDeliveryState extends State<DashboardScreenDelivery> {
  bool isOnline = false; // toggle state

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Example incentive data
    int completedDeliveries = 6;
    int targetDeliveries = 10;
    int remaining = targetDeliveries - completedDeliveries;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Home",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(CupertinoIcons.bell),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              // 👇 Toggle switch
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Go online",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                    Switch(
                      value: isOnline,
                      onChanged: (value) {
                        setState(() {
                          isOnline = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              // 👇 Today's Earnings Card
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.15,
                child: StatCard(
                  title: "Today's Earnings",
                  value: "\$120",
                  percentage: null,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              // 👇 Incentives Progress Card
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white, // light cream
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Incentives",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                        Text(
                          "$completedDeliveries/$targetDeliveries",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: completedDeliveries / targetDeliveries,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      "Complete $remaining more deliveries to earn \$20",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown.shade400,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Active Delivery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Pickup ETA 10:30 AM",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9E8F47),
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Order #12345",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "123 Main St, Anytown",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9E8F47),
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage(TImage.truck_dash)),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Next Pickup",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "ETA 11:00 AM",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9E8F47),
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Restaurant Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "456 Oak Ave, Anytown",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9E8F47),
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(image: AssetImage(TImage.delivered_dash)),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: screenWidth * 0.9,
                child: CommonButtonGrey(
                  label: "Call Support",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
