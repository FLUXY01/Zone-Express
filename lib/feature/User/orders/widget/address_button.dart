import 'package:flutter/material.dart';

class AddressButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Widget label;

  const AddressButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white, // white background
        side: const BorderSide(color: Colors.black, width: 2), // black border
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // square corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      icon: icon,
      label: label,
    );
  }
}
