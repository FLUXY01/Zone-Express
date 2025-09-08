import 'package:flutter/material.dart';

import '../../../../utils/constants/font.dart';

class DocumentRow extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final VoidCallback? onEdit;

  const DocumentRow({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          // Left icon inside container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6ED), // light background for icon
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(leadingIcon, color: Colors.black87, size: 24),
          ),
          const SizedBox(width: 16),

          // Title & subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9E8A47),
                    fontFamily: Tfonts.workSansFont, // golden color
                  ),
                ),
              ],
            ),
          ),

          // Edit icon
          GestureDetector(
            onTap: onEdit,
            child: const Icon(Icons.edit, color: Colors.black87, size: 27),
          ),
        ],
      ),
    );
  }
}
