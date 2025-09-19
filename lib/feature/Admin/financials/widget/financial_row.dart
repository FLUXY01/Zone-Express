import 'package:flutter/material.dart';
import '../../../../utils/constants/font.dart';

class FinancialRow extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String? subtitle;
  final String? endText; // 👈 optional right-side text
  final IconData? endIcon; // 👈 optional right-side icon
  final VoidCallback? onTap; // 👈 new callback for tap

  const FinancialRow({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    this.endText,
    this.endIcon,
    this.onTap, // 👈 allow passing tap handler
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8), // ripple effect rounded
      onTap: onTap, // whole row clickable
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ), // spacing for tap area
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // Title & optional subtitle
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
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9E8A47),
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // End Text or End Icon (right side)
            if (endText != null)
              Text(
                endText!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontFamily: Tfonts.workSansFont,
                ),
              )
            else if (endIcon != null)
              Icon(endIcon, size: 20, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
