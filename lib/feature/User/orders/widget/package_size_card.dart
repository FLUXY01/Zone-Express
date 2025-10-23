import 'package:flutter/material.dart';
import '../../../../utils/constants/font.dart';

class PackageSizeCard extends StatelessWidget {
  final String label; // e.g., "XS", "S"
  final String weightRange; // e.g., "upto 0.5 Kg", "0.5 Kg - 2 Kg"
  final bool isSelected;
  final VoidCallback? onTap;

  const PackageSizeCard({
    super.key,
    required this.label,
    required this.weightRange,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[50]! : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.yellow[300]! : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pink label (XS, S, M, etc.)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Weight text
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: weightRange,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
