import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/font.dart';

class CustomSelectableButton extends StatelessWidget {
  final String label;
  final int index;
  final RxInt selectedIndex;

  const CustomSelectableButton({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = selectedIndex.value == index;
      return GestureDetector(
        onTap: () {
          selectedIndex.value = index; // 👈 update value with GetX
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF9E8F47) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFDEDAC5), width: 1.5),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
              fontFamily: Tfonts.plusJakartaSansFont,
            ),
          ),
        ),
      );
    });
  }
}
