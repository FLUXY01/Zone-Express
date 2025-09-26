import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'country_code.dart'; // your formatter
import '../../../../utils/constants/font.dart';

class PhoneTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? prefixText;

  const PhoneTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isObscure,
    this.keyboardType = TextInputType.phone,
    this.maxLength,
    this.prefixText,
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
        keyboardType: keyboardType,
        maxLength: maxLength,
        inputFormatters: [CountryCodeFormatter()],
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Tfonts.plusJakartaSansFont,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
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
