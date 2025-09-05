import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/Delivery/dashboard/screens/dashboard_delivery.dart';
import 'package:zone_express/feature/Delivery/login/controller/bank_details_controller.dart';
import 'package:zone_express/feature/Delivery/login/widget/custom_textfield_bank_details.dart';
import 'package:zone_express/feature/Delivery/main_screen_delivery.dart';
import '../../../../utils/constants/font.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final BankDetailsController bankDetailsController = Get.put(
    BankDetailsController(),
  );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your bank details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Enter your bank account details to receive your earnings.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextFieldBank(
              hintText: "Account Holder Name",
              controller: bankDetailsController.accountHolderNameController,
              isObscure: false,
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextFieldBank(
              hintText: "Account Number",
              controller: bankDetailsController.accountNumberController,
              isObscure: false,
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextFieldBank(
              hintText: "IFSC Code",
              controller: bankDetailsController.ifscCodeController,
              isObscure: false,
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextFieldBank(
              hintText: "Bank Name",
              controller: bankDetailsController.bankNameController,
              isObscure: false,
            ),
            SizedBox(height: screenHeight * 0.01),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your details are encrypted and secure.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  fontFamily: Tfonts.workSansFont,
                  color: Color(0xFF9C874A),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.09),
            SizedBox(
              width: screenWidth * 0.9,
              child: CommonButtonYellow(
                label: "Submit",
                onPressed: () {
                  Get.off(() => const MainScreenDelivery());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
