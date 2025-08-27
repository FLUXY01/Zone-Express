import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/User/login/controller/login_email_controller.dart';
import '../../../../common/comm_button_yellow.dart';
import '../../../../utils/constants/font.dart';
import '../widget/custom_textfield_user_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginEmailController = Get.put(LoginEmailController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
            SizedBox(height: screenHeight * 0.15),
            Center(
              child: Text(
                "Welcome Back",
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
                "Log in to your existing account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.09),

            /// Email Field
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Email",
                    isObscure: false,
                    controller: loginEmailController.emailController,
                  ),
                  Obx(
                    () => loginEmailController.emailError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              loginEmailController.emailError.value,
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

            /// Password Field
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldUserLogin(
                    hintText: "Password",
                    isObscure: true,
                    controller: loginEmailController.passwordController,
                  ),
                  Obx(
                    () => loginEmailController.passwordError.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              loginEmailController.passwordError.value,
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

            /// Login Button
            SizedBox(
              width: screenWidth * 0.9,
              child: CommonButtonYellow(
                label: "Log In",
                onPressed: () {
                  loginEmailController.login();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
