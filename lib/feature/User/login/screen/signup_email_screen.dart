import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/login/controller/signup_email_controller.dart';
import 'package:zone_express/feature/User/login/widget/custom_textfield_user_login.dart';

import '../../../../utils/constants/font.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupEmailController = Get.put(SignUpEmailController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Zone Express",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Center(
              child: Text(
                "Let's Get Started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            // Username
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Username",
                    isObscure: false,
                    controller: signupEmailController.usernameController,
                  ),
                  Obx(
                    () => signupEmailController.usernameError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              signupEmailController.usernameError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Email
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Email",
                    isObscure: false,
                    controller: signupEmailController.emailController,
                  ),
                  Obx(
                    () => signupEmailController.emailError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              signupEmailController.emailError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Password
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Password",
                    isObscure: true,
                    controller: signupEmailController.passwordController,
                  ),
                  Obx(
                    () => signupEmailController.passwordError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              signupEmailController.passwordError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Confirm Password
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Confirm Password",
                    isObscure: true,
                    controller: signupEmailController.confirmPasswordController,
                  ),
                  Obx(
                    () => signupEmailController.confirmPasswordError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              signupEmailController.confirmPasswordError.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              width: screenWidth * 0.9,
              child: CommonButtonYellow(
                label: "Sign Up",
                onPressed: () {
                  signupEmailController.signup();
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: Tfonts.plusJakartaSansFont,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
