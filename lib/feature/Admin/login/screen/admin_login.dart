import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/Admin/dashboard/screen/admin_dashboard.dart';
import 'package:zone_express/feature/Admin/login/controller/admin_login_controller.dart';
import 'package:zone_express/feature/Admin/login/widget/custom_textfield_admin_login.dart';
import 'package:zone_express/feature/Admin/main_screen_admin.dart';

import '../../../../utils/constants/font.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final adminLoginController controller = Get.put(adminLoginController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.2),
              CustomTextFieldAdmin(
                hintText: "Email",
                controller: controller.emailController,
                isObscure: false,
              ),
              SizedBox(height: screenHeight * 0.06),
              CustomTextFieldAdmin(
                hintText: "Password",
                controller: controller.passwordController,
                isObscure: false,
              ),
              SizedBox(height: screenHeight * 0.06),
              SizedBox(
                width: screenWidth * 0.9,
                child: CommonButtonYellow(
                  label: "login",
                  onPressed: () {
                    Get.to(() => MainScreenAdmin());
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "or login with SSO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9E8A47), // gold color
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: CommonButtonGrey(
                      label: "Workspace",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: CommonButtonGrey(
                      label: "Microsoft",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
