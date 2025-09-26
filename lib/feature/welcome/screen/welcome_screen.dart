import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zone_express/common/common_button.dart';
import 'package:zone_express/feature/Admin/login/screen/admin_login.dart';
import 'package:zone_express/feature/Delivery/login/screens/profile_intro.dart';
import 'package:zone_express/feature/User/login_Signup/screen/login_signup.dart';
import '../../../utils/constants/font.dart';
import '../controller/video_controller.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final VideoController videoCtrl;
  int? pressedIndex;

  @override
  void initState() {
    super.initState();
    videoCtrl = Get.put(VideoController());
  }

  @override
  void dispose() {
    if (Get.isRegistered<VideoController>()) {
      Get.delete<VideoController>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_shipping, size: 50, color: Colors.yellow[700]),
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
            SizedBox(height: screenHeight * 0.05),
            Obx(() {
              if (videoCtrl.isInitialized.value) {
                return AspectRatio(
                  aspectRatio:
                      videoCtrl.videoPlayerController.value.aspectRatio,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: VideoPlayer(videoCtrl.videoPlayerController),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
            SizedBox(height: screenHeight * 0.05),
            CommonButton(
              icon: Icons.shopping_cart,
              label: "I’m a Customer",
              isPressed: pressedIndex == 0,
              onPressed: () {
                setState(() {
                  pressedIndex = 0;
                });
                Get.off(() => LoginSignup());
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            CommonButton(
              icon: Icons.delivery_dining,
              label: "I’m a Delivery Partner",
              isPressed: pressedIndex == 1,
              onPressed: () {
                setState(() {
                  pressedIndex = 1;
                });
                Get.off(() => ProfileIntro());
              },
            ),
          ],
        ),
      ),

      // 👇 Admin Login Footer
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Navigate to Admin Login screen
          Get.off(() => AdminLogin());
        },
        child: Text(
          "Admin Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9E8A47), // gold color
          ),
        ),
      ),
    );
  }
}
