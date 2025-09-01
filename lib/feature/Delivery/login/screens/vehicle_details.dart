import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/Delivery/login/controller/required_document_controller.dart';
import 'package:zone_express/feature/Delivery/login/screens/bank_details.dart';
import 'package:zone_express/feature/Delivery/login/widget/required_document_textfield.dart';

import '../../../../utils/constants/font.dart';
import '../widget/custom_textfield_vehicle.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  final RequiredDocumentController requiredDocumentController = Get.put(
    RequiredDocumentController(),
  );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vehicle Details",
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/images/delivery_img/truck_img.png'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Enter your vehicle details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Provide accurate details of your delivery vehicle.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Vehicle Type",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomTextFieldVehicle(
                hintText: "e.g., Bike, Car, Truck",
                controller: TextEditingController(),
                isObscure: false,
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Vehicle Number Plate",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomTextFieldVehicle(
                hintText: "e.g., ABC-1234",
                controller: TextEditingController(),
                isObscure: false,
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Vehicle Model",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomTextFieldVehicle(
                hintText: "e.g., Toyota Corolla 2020",
                controller: TextEditingController(),
                isObscure: false,
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Insurance Copy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              RequiredDocumentTextfield(
                hintText: "Insurance Copy",
                imageFile: requiredDocumentController.insuranceImage,
                onPickImage: requiredDocumentController.pickInsurance,
                onClearImage: requiredDocumentController.clearInsurance,
              ),
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: CommonButtonYellow(
                    label: "Continue",
                    onPressed: () {
                      Get.to(() => const BankDetails());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
