import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zone_express/common/common_button.dart';
import '../../../utils/constants/font.dart';
import '../../User/login/screen/choice_screen.dart';
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
    // Register controller only once
    videoCtrl = Get.put(VideoController());
  }

  @override
  void dispose() {
    // Dispose controller when screen is disposed
    if (Get.isRegistered<VideoController>()) {
      Get.delete<VideoController>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Zone Express",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: Tfonts.plusJakartaSansFont,
              ),
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
                Get.off(() => ChoiceScreen());
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
                Get.snackbar(
                  "Delivery Partner",
                  "Navigating to Delivery Partner Home",
                );
                // Get.to(DeliveryHomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
