import 'package:flutter/material.dart';
import 'package:zone_express/utils/constants/font.dart';

class StepProgress extends StatelessWidget {
  final int currentStep; // 0 = ADDRESS, 1 = PACKAGE, 2 = SCHEDULE, 3 = SUMMARY

  const StepProgress({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ["ADDRESS", "PACKAGE", "SCHEDULE", "SUMMARY"];

    return Column(
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isOdd) {
              // Line between circles
              return Expanded(
                child: Container(height: 2, color: Colors.grey.shade400),
              );
            } else {
              int stepIndex = index ~/ 2;
              bool isActive = stepIndex == currentStep;

              return Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              );
            }
          }),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps.asMap().entries.map((entry) {
            final index = entry.key;
            final label = entry.value;
            final isActive = index == currentStep;

            // 🎨 Style rules
            final textStyle = TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: isActive ? 14 : 13,
              color: isActive ? Colors.black : Colors.grey.shade600,
              letterSpacing: 0.5,
              fontFamily: Tfonts.plusJakartaSansFont,
            );

            return Expanded(
              child: Center(child: Text(label, style: textStyle)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
