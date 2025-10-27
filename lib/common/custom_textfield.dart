import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: _isFocused ? Colors.blueAccent : Colors.grey,
              )
            : null,
        labelStyle: TextStyle(
          color: _isFocused ? Colors.blueAccent : Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 14,
        ),
      ),
      cursorColor: Colors.blueAccent,
    );
  }
}
