import 'package:flutter/material.dart';

import '../../../../utils/constants/font.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F2E5), // light cream background
        borderRadius: BorderRadius.circular(16), // rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.green,
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
          ),
        ],
      ),
    );
  }
}
