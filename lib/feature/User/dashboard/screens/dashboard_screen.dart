import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/User/dashboard/widget/loyalty_row.dart';
import 'package:zone_express/utils/constants/font.dart';
import 'package:zone_express/utils/constants/images.dart';

import '../widget/stat_card.dart';

class DashboardScreenUser extends StatefulWidget {
  const DashboardScreenUser({super.key});

  @override
  State<DashboardScreenUser> createState() => _DashboardScreenUserState();
}

class _DashboardScreenUserState extends State<DashboardScreenUser> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      "Dashboard",
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
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick Actions",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CommonButtonYellow(
                        label: "New Delivery",
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: screenWidth * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: CommonButtonGrey(
                        label: "Schedule",
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Active Orders",
                    textAlign: TextAlign.left,
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
                          "Order ID: 12345",
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
                          "Delivery to 123 Main St",
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
                          "Status: In Transit",
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
              SizedBox(height: screenHeight * 0.06),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Order: 67890",
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
                          "Delivery to 456 Elm St",
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
                          "Status: Delivered",
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
              SizedBox(height: screenHeight * 0.06),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    textAlign: TextAlign.left,
                    "Loyalty Offers",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              LoyaltyRow(
                leadingIcon: Icons.card_giftcard_rounded,
                title: "Free Delivery",
                subtitle: "500 Points",
                trailingButton: SizedBox(
                  width: screenWidth * 0.3,
                  child: CommonButtonGrey(label: "Redeem", onPressed: () {}),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              LoyaltyRow(
                leadingIcon: Icons.card_giftcard_rounded,
                title: "Discount on Next Order",
                subtitle: "1000 Points",
                trailingButton: SizedBox(
                  width: screenWidth * 0.3,
                  child: CommonButtonGrey(label: "Redeem", onPressed: () {}),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              LoyaltyRow(
                leadingIcon: Icons.card_giftcard_rounded,
                title: "Exclusive Merchandise",
                subtitle: "1500 Points",
                trailingButton: SizedBox(
                  width: screenWidth * 0.3,
                  child: CommonButtonGrey(label: "Redeem", onPressed: () {}),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
