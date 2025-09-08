import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/feature/Delivery/main_screen_delivery.dart';
import 'package:zone_express/feature/Delivery/more/widget/help_row.dart';
import 'package:zone_express/feature/Delivery/more/widget/opiton_card.dart';
import 'package:zone_express/utils/constants/font.dart';

class HelpSafetyScreen extends StatefulWidget {
  const HelpSafetyScreen({super.key});

  @override
  State<HelpSafetyScreen> createState() => _HelpSafetyScreenState();
}

class _HelpSafetyScreenState extends State<HelpSafetyScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.to(MainScreenDelivery());
          },
        ),
        title: Text(
          "Help & Safety",
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
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Help Center",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.1,
                      child: OptionCard(
                        icon: Icons.help_outline,
                        title: "FAQ",
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.1,
                      child: OptionCard(
                        icon: Icons.call_outlined,
                        title: "Contact Support",
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth * 0.5,
                child: OptionCard(
                  icon: Icons.chat_bubble_outline,
                  title: "Chat Support",
                  onTap: () {},
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                "Safety",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              HelpRow(
                leadingIcon: Icons.health_and_safety_outlined,
                title: "Emergency",
                subtitle: "Call emergency contact and share live location",
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                "Report an Incident",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              HelpRow(
                leadingIcon: Icons.health_and_safety_outlined,
                title: "Report",
                subtitle: "Report an incident with photos and notes",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
