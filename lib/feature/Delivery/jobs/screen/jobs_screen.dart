import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/Delivery/jobs/widget/custom_drop_down.dart';
import 'package:zone_express/feature/Delivery/jobs/widget/delivery_card.dart';
import '../../../../utils/constants/font.dart';
import 'job_details_screen.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Available Jobs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        hintText: "Distance",
                        options: ["Price", "Ratings", "Distance", "Popularity"],
                      ),
                    ),
                    const SizedBox(width: 8), // spacing between dropdowns
                    Expanded(
                      child: CustomDropdown(
                        hintText: "Price",
                        options: ["Price", "Ratings", "Distance", "Popularity"],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: CustomDropdown(
                          hintText: "Service Type",
                          options: [
                            "Price",
                            "Ratings",
                            "Distance",
                            "Popularity",
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: DeliveryCard(
                    pickupLocation: "Pickup Downtown",
                    distanceTime: "1.2 mi · 10:00 AM - 10:30 AM",
                    sizePrice: "Small · \$12.50",
                    surgeText: "+\$2.50 Surge",
                    surgeIcon: Icons.bolt_outlined,
                    onTap: () {
                      Get.to(() => JobDetailsScreen());
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: DeliveryCard(
                    pickupLocation: "Pickup Downtown",
                    distanceTime: "1.2 mi · 10:00 AM - 10:30 AM",
                    sizePrice: "Small · \$12.50",
                    surgeText: "+\$2.50 Surge",
                    surgeIcon: Icons.bolt_outlined,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: DeliveryCard(
                    pickupLocation: "Pickup Downtown",
                    distanceTime: "1.2 mi · 10:00 AM - 10:30 AM",
                    sizePrice: "Small · \$12.50",
                    surgeText: "+\$2.50 Surge",
                    surgeIcon: Icons.bolt_outlined,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: DeliveryCard(
                    pickupLocation: "Pickup Downtown",
                    distanceTime: "1.2 mi · 10:00 AM - 10:30 AM",
                    sizePrice: "Small · \$12.50",
                    surgeText: "+\$2.50 Surge",
                    surgeIcon: Icons.bolt_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
