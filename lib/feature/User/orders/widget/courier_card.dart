import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/courier_controller.dart';

class CourierCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String deliveryType;
  final String imagePath;

  CourierCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.deliveryType,
    required this.imagePath,
  }) : super(key: key);

  final CourierController controller = Get.put(CourierController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.15, // keep fixed card height
      width: screenWidth,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(2, 3), // shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section (Text Info)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$subtitle · $price · $deliveryType",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      bool isSelected =
                          controller.selectedCourier.value == title;
                      return ElevatedButton(
                        onPressed: () {
                          // toggle selection
                          if (isSelected) {
                            controller.selectedCourier.value = "";
                          } else {
                            controller.selectCourier(title);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.blue.shade600
                              : Colors.grey.shade200,
                          foregroundColor: isSelected
                              ? Colors.white
                              : Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(isSelected ? "Selected" : "Select"),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Right Section (Blue Box Image)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: screenHeight * 0.1,
              width: screenWidth * 0.22,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
