import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/orders/screens/order_screen.dart';
import 'package:zone_express/feature/User/orders/screens/to_me_screen.dart';
import 'package:zone_express/utils/constants/font.dart';

class TrackOrderContainer extends StatelessWidget {
  const TrackOrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFF6F6F6), // subtle grey shade bottom gradient
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Location Icon
          const Icon(
            Icons.location_on_rounded,
            color: Colors.redAccent,
            size: 26,
          ),
          const SizedBox(width: 10),

          // 🔹 Text Section (Expandable)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Track Your Orders",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.85),
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Get real-time status",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // 🔹 Your Track Button
          SizedBox(
            width: 110, // ✅ keeps button from overflowing
            height: 42,
            child: CommonButtonYellow(
              label: "Track →",
              onPressed: () {
                Get.to(() => OrderScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
