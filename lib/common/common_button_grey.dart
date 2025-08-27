import 'package:flutter/material.dart';

import '../utils/constants/font.dart';

class CommonButtonGrey extends StatelessWidget {
  final IconData? icon; // optional
  final String label;
  final VoidCallback onPressed;

  const CommonButtonGrey({
    Key? key,
    this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(250, 50),
      backgroundColor: const Color(0xFFF5F2E5),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        style: buttonStyle,
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
      );
    }
  }
}
