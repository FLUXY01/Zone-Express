import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/User/dashboard/widget/dashboard_container.dart';
import 'package:zone_express/feature/User/get%20help/screens/get_help.dart';
import 'package:zone_express/feature/User/location/screens/location_search_page.dart';
import 'package:zone_express/feature/User/orders/screens/package_details.dart';
import 'package:zone_express/utils/constants/font.dart';
import '../../location/controller/pickup_location_controller.dart';

class DashboardScreenUser extends StatefulWidget {
  const DashboardScreenUser({super.key});

  @override
  State<DashboardScreenUser> createState() => _DashboardScreenUserState();
}

class _DashboardScreenUserState extends State<DashboardScreenUser> {
  final controller = Get.put(PickupLocationController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  height: screenHeight * 0.085,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => LocationSearchPage());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "pick up from",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                                fontFamily: Tfonts.plusJakartaSansFont,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black54,
                              size: 24,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 29.0),
                            child: Obx(
                              () => Text(
                                controller.currentAddress.value.isNotEmpty
                                    ? controller.currentAddress.value
                                    : "Fetching location...",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF9E8F47),
                                  fontFamily: Tfonts.plusJakartaSansFont,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              DashCard(
                onTap: () {
                  Get.to(() => PackageDetails());
                },
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  Get.to(() => GetHelp());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.live_help_outlined,
                          color: Colors.redAccent,
                          size: 24,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "Get Help",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey[700],
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  height: screenHeight * 0.23,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "can't find your delivery?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          fontFamily: Tfonts.plusJakartaSansFont,
                        ),
                      ),
                      Text(
                        "Find your delivery using your Order ID",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9E8F47),
                          fontFamily: Tfonts.plusJakartaSansFont,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Order ID",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontFamily: Tfonts.plusJakartaSansFont,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your Order ID",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: Tfonts.plusJakartaSansFont,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey[700],
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Send Anything,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF9CA3AF),
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Anywhere",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF9CA3AF),
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Icon(Icons.square, color: Colors.yellow, size: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
