import 'package:flutter/material.dart';
import '../../../../utils/constants/font.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool selectable;

  const PackageCard({
    super.key,
    required this.title,
    this.imagePath,
    this.icon,
    this.isSelected = false,
    this.onTap,
    this.selectable = true,
  }) : assert(
         imagePath != null || icon != null,
         'Either imagePath or icon must be provided.',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectable ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[50]! : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.yellow[300]! : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, height: 80)
            else if (icon != null)
              Icon(
                icon,
                size: 60,
                color: isSelected ? Colors.yellow[700] : Colors.grey[700],
              ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontFamily: Tfonts.plusJakartaSansFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
