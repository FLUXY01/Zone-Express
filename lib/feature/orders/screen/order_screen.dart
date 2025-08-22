import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/orders/controller/order_controller.dart';
import 'package:zone_express/feature/orders/widget/custom_textfield.dart';

import '../widget/custom_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final formController = Get.put(FormController());
  final RxInt selectedIndex = (-1).obs;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Schedule a Delivery",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: screenWidth * 0.9,
                child: CustomTextField(
                  hintText: "Pickup Address",
                  controller: formController.pickupAddressController,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: screenWidth * 0.9,
                child: CustomTextField(
                  hintText: "Drop-off Address",
                  controller: formController.dropOffAddressController,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Package Details",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: screenWidth * 0.9,
                child: CustomTextField(
                  hintText: "Size of Package",
                  controller: formController.dropOffAddressController,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: screenWidth * 0.9,
                child: CustomTextField(
                  hintText: "Weight of Package",
                  controller: formController.dropOffAddressController,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Service Options",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: CustomSelectableButton(
                      label: "Express",
                      index: 0,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  CustomSelectableButton(
                    label: "Eco",
                    index: 1,
                    selectedIndex: selectedIndex,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  CustomSelectableButton(
                    label: "Bulk",
                    index: 2,
                    selectedIndex: selectedIndex,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Instant Quote",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Estimated Cost: \$25-\$30",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Courier Recommendations",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/courier_img/courier_1.png',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Swift Courier",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Fastest Delivery",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF9E8F47),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/courier_img/courier_1.png',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Budget Express",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Most affordable",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF9E8F47),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: screenWidth * 0.9,
                child: CommonButtonYellow(
                  label: "Schedule Pickup",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
