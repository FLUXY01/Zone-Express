import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/common_button.dart';
import 'package:zone_express/feature/Delivery/dashboard/screens/dashboard_delivery.dart';
import 'package:zone_express/feature/User/dashboard/screens/dashboard_screen.dart';
import 'package:zone_express/feature/User/login/screen/login_email_screen.dart';
import 'package:zone_express/feature/User/login/screen/signup_email_screen.dart';
import 'package:zone_express/feature/User/main_screen_user.dart';
import 'package:zone_express/utils/constants/font.dart';

/// Enum for choices
enum ChoiceType { email, social, guest, login }

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  ChoiceType? pressed; // current pressed button

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                // Email Button
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.email_outlined,
                    label: "Continue with Email",
                    isPressed: pressed == ChoiceType.email,
                    onPressed: () {
                      setState(() {
                        pressed = ChoiceType.email;
                      });
                      Get.to(() => const SignUpScreen());
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Social Button
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.people_alt_outlined,
                    label: "Continue with Social",
                    isPressed: pressed == ChoiceType.social,
                    onPressed: () {
                      setState(() {
                        pressed = ChoiceType.social;
                      });
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Guest Button
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.person_2_outlined,
                    label: "Continue as Guest",
                    isPressed: pressed == ChoiceType.guest,
                    onPressed: () {
                      setState(() {
                        pressed = ChoiceType.guest;
                      });
                      Get.to(() => MainScreenUser());
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Divider with OR
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Color(0xFFDEDAC5),
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xFFDEDAC5),
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),

                // Login Button
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButton(
                    icon: Icons.login_outlined,
                    label: "Login",
                    isPressed: pressed == ChoiceType.login,
                    onPressed: () {
                      setState(() {
                        pressed = ChoiceType.login;
                      });
                      Get.to(() => const LoginScreen());
                    },
                  ),
                ),
              ],
            ),

            // Footer Text
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
