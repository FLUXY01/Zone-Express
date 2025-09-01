import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/Delivery/login/screens/signup_screen.dart';
import '../../../../utils/constants/font.dart';
import '../controller/step_controller.dart';

class ProfileIntro extends StatelessWidget {
  ProfileIntro({super.key});

  final StepController stepController = Get.put(StepController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complete your profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          double progress =
              stepController.currentStep.value / stepController.totalSteps;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
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

              // 👇 Dynamic content depending on step
              if (stepController.currentStep.value == 1) ...[
                Text(
                  "Verify your identity",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Please fill in all the required details carefully, as the information you provide will play a crucial role in the selection process for the delivery partner job.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ],
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButtonYellow(
                    label:
                        stepController.currentStep.value ==
                            stepController.totalSteps
                        ? "Finish"
                        : "Next",
                    onPressed: () {
                      stepController.nextStep();
                      Get.to(() => DeliverySignUpScreen());
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
