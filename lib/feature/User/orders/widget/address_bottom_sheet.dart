import 'package:flutter/material.dart';

class AddressBottomSheet extends StatelessWidget {
  final bool isPickup;

  const AddressBottomSheet({super.key, required this.isPickup});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isPickup ? "Select Pickup Address" : "Select Delivery Address",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          SizedBox(height: screenHeight * 0.02, width: double.infinity),

          // Add New Address row
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "Add New Address",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          const Divider(thickness: 1, color: Colors.grey),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
