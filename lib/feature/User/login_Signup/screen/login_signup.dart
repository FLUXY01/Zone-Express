import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/dashboard/screens/dashboard_screen.dart';
import 'package:zone_express/feature/User/login_Signup/widget/otp_verification.dart';
import 'package:zone_express/feature/User/login_Signup/widget/phone_textfield.dart';
import 'package:zone_express/feature/User/main_screen_user.dart';
import '../../../../utils/constants/font.dart';
import '../widget/custom_textfield_user_login.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// ---------- TOP CONTENT ----------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_shipping,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Zone",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: Tfonts.plusJakartaSansFont,
                              ),
                            ),
                            TextSpan(
                              text: " Express",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                                fontFamily: Tfonts.plusJakartaSansFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "World's No.1 Logistic App",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),

                  // Title
                  Text(
                    "Send Anything",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  /// ---------- CARDS ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOptionCard(
                        icon: Icons.location_city,
                        title: "IN YOUR CITY",
                        subtitle: "Quick delivery",
                        context: context,
                      ),
                      _buildOptionCard(
                        icon: Icons.public,
                        title: "WORLDWIDE",
                        subtitle: "Global delivery",
                        context: context,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// ---------- BOTTOM LOGIN/SIGNUP ----------
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12), // lift it up a bit
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15), // darker shadow
                      blurRadius: 20, // more blur
                      spreadRadius: 2, // spread the shadow
                      offset: const Offset(0, 0), // push shadow downward
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Log in or Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Name field
                    CustomTextFieldUserLogin(
                      hintText: "Enter your name",
                      controller: nameController,
                      isObscure: false,
                    ),
                    const SizedBox(height: 12),

                    // Phone field
                    PhoneTextField(
                      hintText: "Enter your country code & phone",
                      controller: phoneController,
                      isObscure: false,
                      keyboardType: TextInputType.phone,
                      maxLength: 13, // total length with country code
                      prefixText: "+",
                    ),

                    const SizedBox(height: 20),

                    // Button
                    SizedBox(
                      width: double.infinity,
                      child: CommonButtonYellow(
                        label: "Get OTP",
                        onPressed: () {
                          showOtpBottomSheet(context, phoneController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- CARD WIDGET ----------
  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.4, // 40% of screen width
      height: screenHeight * 0.16, // ~16% of screen height
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.yellow[700], size: screenWidth * 0.1),
          SizedBox(height: screenHeight * 0.01),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04, // responsive font
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black54,
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showOtpBottomSheet(BuildContext context) {
    // Controllers + FocusNodes for OTP
    List<TextEditingController> controllers = List.generate(
      6,
      (index) => TextEditingController(),
    );
    List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

    // Timer for Resend OTP
    RxInt seconds = 60.obs; // using GetX reactive variable

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "OTP is sent to +${phoneController.text}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),

                /// OTP Boxes with Auto Focus
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 45,
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(
                              context,
                            ).requestFocus(focusNodes[index + 1]);
                          }
                          if (value.isEmpty && index > 0) {
                            FocusScope.of(
                              context,
                            ).requestFocus(focusNodes[index - 1]);
                          }
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Resend Timer
                Obx(
                  () => Text(
                    seconds.value > 0
                        ? "Resend in 00:${seconds.value.toString().padLeft(2, '0')}"
                        : "Resend OTP",
                    style: TextStyle(
                      color: seconds.value > 0 ? Colors.red : Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      // Collect OTP
                      String otp = controllers.map((c) => c.text).join();
                      if (otp.length == 6) {
                        Get.offAll(() => const DashboardScreenUser());
                      } else {
                        Get.snackbar("Error", "Please enter complete OTP");
                      }
                    },
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
