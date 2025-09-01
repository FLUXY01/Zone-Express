import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/Delivery/login/controller/required_document_controller.dart';
import 'package:zone_express/feature/Delivery/login/screens/vehicle_details.dart';
import 'package:zone_express/feature/Delivery/login/widget/required_document_textfield.dart';

import '../../../../utils/constants/font.dart';

class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({super.key});

  @override
  State<RequiredDocuments> createState() => _RequiredDocumentsState();
}

class _RequiredDocumentsState extends State<RequiredDocuments> {
  final RequiredDocumentController requiredDocumentController = Get.put(
    RequiredDocumentController(),
  );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Upload required documents",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please upload clear photos of the required documents for verification.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Aadhar Card/Passport/Voter ID",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            RequiredDocumentTextfield(
              hintText: "Upload",
              imageFile: requiredDocumentController.aadharCardImage,
              onPickImage: () => requiredDocumentController.pickAadharCard(),
              onClearImage: () => requiredDocumentController.clearAadharCard(),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Driver's License",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            RequiredDocumentTextfield(
              hintText: "Upload",
              imageFile: requiredDocumentController.drivingLicenseImage,
              onPickImage: () =>
                  requiredDocumentController.pickDrivingLicense(),
              onClearImage: () =>
                  requiredDocumentController.clearDrivingLicense(),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Profile Photo",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            RequiredDocumentTextfield(
              hintText: "Upload",
              imageFile: requiredDocumentController.aadharCardImage,
              onPickImage: () => requiredDocumentController.pickAadharCard(),
              onClearImage: () => requiredDocumentController.clearAadharCard(),
            ),
            SizedBox(height: screenHeight * 0.02),
            FittedBox(
              child: Text(
                "Make sure all the documents are clear and legible.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: Tfonts.workSansFont,
                  color: Color(0xFF9C874A),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: CommonButtonYellow(
                  label: "Continue",
                  onPressed: () {
                    Get.to(() => const VehicleDetails());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
