import 'package:flutter/material.dart';
import 'package:zone_express/feature/Delivery/profile/widget/document_row.dart';
import 'package:zone_express/utils/constants/images.dart';

import '../../../../utils/constants/font.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile & Settings",
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(TImage.courier_boy),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Column(
                      children: [
                        Text(
                          "Ethan Carter",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Tfonts.workSansFont,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Courier ID: 123456",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: Tfonts.workSansFont,
                              color: Color(0xFF9E8A47),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                DocumentRow(
                  leadingIcon: Icons.insert_drive_file_outlined,
                  title: "Driver's License",
                  subtitle: "Verified",
                ),
                SizedBox(height: screenHeight * 0.03),
                DocumentRow(
                  leadingIcon: Icons.insert_drive_file_outlined,
                  title: "National ID",
                  subtitle: "Verified",
                ),
                SizedBox(height: screenHeight * 0.03),
                DocumentRow(
                  leadingIcon: Icons.insert_drive_file_outlined,
                  title: "Address",
                  subtitle: "Verified",
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Vehicle",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                DocumentRow(
                  leadingIcon: Icons.directions_car_filled_outlined,
                  title: "Vehicle Type",
                  subtitle: "Car",
                ),
                SizedBox(height: screenHeight * 0.03),
                DocumentRow(
                  leadingIcon: Icons.insert_drive_file_outlined,
                  title: "Vehicle Insurance",
                  subtitle: "Verified",
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Preferences",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFF8F6ED,
                        ), // light background for icon
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.black87,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Title & subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Accept heavy packages",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: Tfonts.workSansFont,
                            ),
                          ),
                        ],
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
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFF8F6ED,
                        ), // light background for icon
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.black87,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Title & subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Accept long distance deliveries",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: Tfonts.workSansFont,
                            ),
                          ),
                        ],
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
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
