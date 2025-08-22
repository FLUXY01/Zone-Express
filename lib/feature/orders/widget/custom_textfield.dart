import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F2E5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color(0xFF9E8F47),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Plus Jakarta Sans",
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9E8F47),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Plus Jakarta Sans",
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
