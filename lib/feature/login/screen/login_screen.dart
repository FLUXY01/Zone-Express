import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/common/common_button.dart';
import 'package:zone_express/feature/dashboard/screens/dashboard_screen.dart';
import 'package:zone_express/feature/main_screen.dart';
import 'package:zone_express/utils/constants/font.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int? pressedIndex;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Zone Express",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // pushes content & footer apart
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                const Text(
                  "How would you like to Signup?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.email_outlined,
                    label: "Continue with Email",
                    isPressed: pressedIndex == 0,
                    onPressed: () {
                      setState(() {
                        pressedIndex = 0;
                      });
                      Get.off(() => const MainScreen());
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.login,
                    label: "Continue with Social",
                    isPressed: pressedIndex == 1,
                    onPressed: () {
                      setState(() {
                        pressedIndex = 1;
                      });
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.person_2_outlined,
                    label: "Continue as Guest",
                    isPressed: pressedIndex == 2,
                    onPressed: () {
                      setState(() {
                        pressedIndex = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "By continuing, you agree to our Terms & Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
