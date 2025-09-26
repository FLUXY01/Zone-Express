import 'package:flutter/material.dart';
import '../../../../utils/constants/font.dart';

class CustomTextFieldUserLogin extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final IconData? prefixIcon;

  const CustomTextFieldUserLogin({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isObscure,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        textCapitalization: TextCapitalization.sentences, // 👈 Added here
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Tfonts.plusJakartaSansFont,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey[600])
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
