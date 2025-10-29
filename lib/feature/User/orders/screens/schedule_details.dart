import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/date_button.dart';
import '../../../../utils/constants/font.dart';
import '../widget/step_progress.dart';
import 'checkout_page.dart';

class ScheduleDetails extends StatefulWidget {
  const ScheduleDetails({super.key});

  @override
  State<ScheduleDetails> createState() => _ScheduleDetailsState();
}

class _ScheduleDetailsState extends State<ScheduleDetails> {
  int currentStep = 2;
  int selectedIndex = 0;

  // ✅ Define your date list here
  final List<Map<String, String>> dates = [
    {'day': 'WED', 'date': '29', 'month': 'Oct'},
    {'day': 'THU', 'date': '30', 'month': 'Oct'},
    {'day': 'FRI', 'date': '31', 'month': 'Oct'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButtonYellow(
          label: "Next",
          onPressed: () {
            Get.to(() => const CheckoutPage());
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StepProgress(currentStep: currentStep),
            ),
            SizedBox(height: screenHeight * 0.02),
            Divider(color: Colors.grey.shade300, thickness: 1),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Pickup Date",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(dates.length, (index) {
                final item = dates[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DateButton(
                    day: item['day']!,
                    date: item['date']!,
                    month: item['month']!,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "13:44 Hrs remaining for next pickup slot",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontFamily: Tfonts.workSansFont,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        "Select a pickup date that's convenient for you - our rider will come right to your doorstep to collect the courier.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          fontFamily: Tfonts.workSansFont,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
