import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/common_button_grey.dart';
import 'package:zone_express/feature/User/orders/screens/package_details.dart';
import 'package:zone_express/feature/User/orders/widget/address_button.dart';

import '../../../../utils/constants/font.dart';
import '../widget/address_bottom_sheet.dart';
import '../widget/step_progress.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({super.key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  int currentStep = 0; // Start at ADDRESS

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send a Package',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step Progress Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: StepProgress(currentStep: currentStep),
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Pickup Address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: AddressButton(
                  onPressed: () {
                    _openAddressBottomSheet(context, isPickup: true);
                  },
                  icon: Icon(Icons.card_giftcard, color: Colors.grey.shade600),
                  label: Text(
                    "Add Pickup Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: AddressButton(
                  onPressed: () {
                    _openAddressBottomSheet(context, isPickup: false);
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey.shade600,
                  ),
                  label: Text(
                    "Add Delivery Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.4),
              SizedBox(
                width: double.infinity,
                child: CommonButtonGrey(
                  label: "Next",
                  onPressed: () {
                    Get.to(() => PackageDetails());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAddressBottomSheet(BuildContext context, {required bool isPickup}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => AddressBottomSheet(isPickup: isPickup),
    );
  }
}
