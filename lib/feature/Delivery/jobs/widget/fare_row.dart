import 'package:flutter/material.dart';

class FareRow extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;

  const FareRow({
    Key? key,
    required this.label,
    required this.value,
    this.labelColor = const Color(0xFF9E8F47),
    this.valueColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // aligns text top
      children: [
        /// Expanded Label (can wrap to next line if long)
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "WorkSans",
              color: labelColor,
            ),
          ),
        ),

        /// Fixed Value (always right-aligned, single vertical line)
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "WorkSans",
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }
}
