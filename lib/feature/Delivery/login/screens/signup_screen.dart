import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/Delivery/login/controller/delivery_signup_controller.dart';
import 'package:zone_express/feature/Delivery/login/screens/required_documents.dart';
import 'package:zone_express/feature/Delivery/login/widget/custom_textfield_delivery.dart';
import '../../../../utils/constants/font.dart';
import '../controller/step_controller.dart';
import 'package:zone_express/common/comm_button_yellow.dart';

class DeliverySignUpScreen extends StatelessWidget {
  DeliverySignUpScreen({super.key});

  final StepController stepController = Get.put(StepController());
  final deliverySignUpController controller = Get.put(
    deliverySignUpController(),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 👇 Set initial step to 2 for this screen
    stepController.setStep(2);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            stepController.prevStep();
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            double progress = stepController.totalSteps == 0
                ? 0
                : stepController.currentStep.value / stepController.totalSteps;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Step ${stepController.currentStep.value}/${stepController.totalSteps}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomTextFieldDeliverySignUp(
                  hintText: "Full Name",
                  controller: controller.fullNameController,
                  isObscure: false,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFieldDeliverySignUp(
                  hintText: "Email",
                  controller: controller.emailController,
                  isObscure: false,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFieldDeliverySignUp(
                  hintText: "Password",
                  controller: controller.passwordController,
                  isObscure: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFieldDeliverySignUp(
                  hintText: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  isObscure: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFieldDeliverySignUp(
                  hintText: "Phone Number",
                  controller: controller.phoneController,
                  isObscure: false,
                ),
                SizedBox(height: screenHeight * 0.03),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: screenWidth * 0.4,
                    child: CommonButtonGrey(
                      label: "Send OTP",
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextFieldDeliverySignUp(
                  hintText: "Enter OTP",
                  controller: controller.otpController,
                  isObscure: false,
                ),
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: CommonButtonYellow(
                      label: "Verify & Continue",
                      onPressed: () {
                        Get.to(() => RequiredDocuments());
                      },
                    ),
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
            );
          }),
        ),
      ),
    );
  }
}
