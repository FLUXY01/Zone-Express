import 'package:flutter/material.dart';

class PickUpCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PickUpCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Icon with rounded background
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F6F0), // soft beige background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black87, size: 24),
        ),

        const SizedBox(width: 12),

        /// Text Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontFamily: "WorkSans",
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9E8F47), // olive/golden color
                fontFamily: "WorkSans",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
