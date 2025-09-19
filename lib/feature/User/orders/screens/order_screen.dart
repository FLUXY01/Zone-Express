import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/orders/widget/courier_card.dart';
import '../../../../utils/constants/font.dart';
import '../../../../utils/constants/images.dart';
import '../controller/order_controller.dart';
import '../widget/custom_textfield_orders.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Schedule a Delivery",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Address Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CustomTextFieldOrders(
                    hintText: "Pickup Address",
                    controller: formController.pickupAddressController,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CustomTextFieldOrders(
                    hintText: "Drop-off Address",
                    controller: formController.dropOffAddressController,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Package Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CustomTextFieldOrders(
                    hintText: "Size of Package",
                    controller: formController.dropOffAddressController,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: CustomTextFieldOrders(
                    hintText: "Weight of Package",
                    controller: formController.dropOffAddressController,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Service Options",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CourierCard(
                  title: "Speedy Express",
                  subtitle: "Same-day",
                  price: '150',
                  deliveryType: "Standard",
                  imagePath: TImage.express,
                ),
                SizedBox(height: screenHeight * 0.03),
                CourierCard(
                  title: "DHL Express",
                  subtitle: "2-3 hrs",
                  price: '180',
                  deliveryType: "Express",
                  imagePath: TImage.dhl,
                ),
                SizedBox(height: screenHeight * 0.03),
                CourierCard(
                  title: "Eco Post",
                  subtitle: "Next Day",
                  price: '120',
                  deliveryType: "Economy",
                  imagePath: TImage.eco,
                ),
                SizedBox(height: screenHeight * 0.03),
                CourierCard(
                  title: "Swift Delivery",
                  subtitle: "2-3 hrs",
                  price: '200',
                  deliveryType: "Standard",
                  imagePath: TImage.swift,
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: CommonButtonYellow(
                    label: "Continue",
                    onPressed: () {},
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
