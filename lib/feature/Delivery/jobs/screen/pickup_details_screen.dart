import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/Delivery/jobs/screen/drop_off_screen.dart';
import 'package:zone_express/feature/Delivery/jobs/widget/pickup_card.dart';

import '../../../../utils/constants/font.dart';

class PickupDetailsScreen extends StatefulWidget {
  const PickupDetailsScreen({super.key});

  @override
  State<PickupDetailsScreen> createState() => _PickupDetailsScreenState();
}

class _PickupDetailsScreenState extends State<PickupDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pickup",
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Pickup Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              PickUpCard(
                icon: Icons.location_on_outlined,
                title: "Sender Address",
                subtitle: "123 Main St, Anytown",
              ),
              SizedBox(height: screenHeight * 0.05),
              PickUpCard(
                icon: Icons.person_2_outlined,
                title: "Sender Name",
                subtitle: "Sophia Carter",
              ),
              SizedBox(height: screenHeight * 0.05),
              PickUpCard(
                icon: Icons.phone_outlined,
                title: "Sender Phone",
                subtitle: "+1-555-123-4567r",
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  Expanded(
                    child: CommonButtonGrey(
                      label: "Call Customer",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: CommonButtonGrey(
                      label: "Customer Support",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.09),
              SizedBox(
                width: double.infinity,
                child: CommonButtonYellow(
                  label: "Arrived at Pickup",
                  onPressed: () {
                    Get.to(() => DropOffScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
