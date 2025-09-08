import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/Delivery/jobs/controller/drop_off_controller.dart';
import 'package:zone_express/feature/Delivery/jobs/widget/custom_textfield_drop_off.dart';
import 'package:zone_express/feature/Delivery/main_screen_delivery.dart';

import '../../../../utils/constants/font.dart';
import '../widget/drop_off_row_widget.dart';

class DropOffScreen extends StatefulWidget {
  const DropOffScreen({super.key});

  @override
  State<DropOffScreen> createState() => _DropOffScreenState();
}

class _DropOffScreenState extends State<DropOffScreen> {
  final DropOffController controller = Get.put(DropOffController());
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drop-Off",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Proof of Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Obx(
                  () => LabeledInputRow(
                    label: "OTP",
                    textController: controller.otpController,
                    errorText: controller.otpError.value,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Obx(
                  () => LabeledInputRow(
                    label: "Signature",
                    imageFile: controller.signatureImage.value,
                    onPickImage: controller.signatureImage,
                    errorText: controller.signatureError.value,
                    hintText: "Take",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Obx(
                  () => LabeledInputRow(
                    label: "Parcel Image",
                    imageFile: controller.parcelImage.value,
                    onPickImage: controller.pickParcelImage,
                    errorText: controller.parcelError.value,
                    hintText: "Take",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Obx(
                  () => LabeledInputRow(
                    label: "Name of Receiver",
                    textController: controller.nameReceiverController,
                    errorText: controller.nameError.value,
                    hintText: "Name",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$25.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Tfonts.plusJakartaSansFont,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Payment mode",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth * 0.26,
                        child: CommonButtonGrey(
                          label: "Select",
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Receipt",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Text(
                      "Confirm receipt",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: Tfonts.plusJakartaSansFont,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                        value: isOnline,
                        onChanged: (value) {
                          setState(() {
                            isOnline = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButtonYellow(
                    label: "Rate Customer",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButtonGrey(
                    label: "Complete Delivery",
                    onPressed: () {
                      Get.to(() => const MainScreenDelivery());
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
