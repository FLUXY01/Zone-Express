import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/orders/screens/address_details.dart';
import '../../../../utils/constants/font.dart';
import '../widget/step_progress.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int currentStep = 3;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: StepProgress(currentStep: currentStep),
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "ADDRESS DETAILS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const AddressDetails());
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                          fontFamily: Tfonts.workSansFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              Column(
                children: [
                  // Pickup Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.teal, width: 2),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 30,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: Tfonts.workSansFont,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(text: 'Home '),
                                  TextSpan(
                                    text: '(Pickup)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'tamil nadu - 603203',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: Tfonts.workSansFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Delivery Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.location_on_outlined,
                              size: 12,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: Tfonts.workSansFont,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(text: 'Office '),
                                  TextSpan(
                                    text: '(Delivery)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'tamil nadu - 603203',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: Tfonts.workSansFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "PACKAGE DETAILS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Envelope",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "upto 0.5 KG",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "30 Oct",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.06),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.local_offer_outlined,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Text(
                    "Apply Promo Code",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Select Delivery Type",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Delivery type card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    // handle selection
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.yellow[300]!,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.yellow[700],
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "SURFACE",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: Tfonts.workSansFont,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "₹ 105.0",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: Tfonts.workSansFont,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Delivery in 1 days",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: Tfonts.workSansFont,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ), // add spacing before bottom bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "₹ 105.0",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
            SizedBox(
              width: 160,
              height: 48,
              child: CommonButtonYellow(
                label: "Proceed to Pay",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
