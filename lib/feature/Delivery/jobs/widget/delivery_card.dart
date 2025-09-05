import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  final String pickupLocation;
  final String distanceTime;
  final String sizePrice;
  final String surgeText;
  final IconData surgeIcon;
  final VoidCallback? onTap;

  const DeliveryCard({
    Key? key,
    required this.pickupLocation,
    required this.distanceTime,
    required this.sizePrice,
    required this.surgeText,
    required this.surgeIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: Colors.grey[100],
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFF5F2E7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pickupLocation,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9E8F47),
                    fontFamily: "PlusJakartaSans",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  distanceTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "PlusJakartaSans",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  sizePrice,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9E8F47),
                    fontFamily: "PlusJakartaSans",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenHeight * 0.02),
                _CustomSurgeCard(text: surgeText, icon: surgeIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomSurgeCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const _CustomSurgeCard({Key? key, required this.text, required this.icon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEFE7C0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.orange),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
