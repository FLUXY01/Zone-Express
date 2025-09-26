import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const ButtonRow({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [selectedIndex == 0, selectedIndex == 1, selectedIndex == 2],
      onPressed: onSelected,
      borderRadius: BorderRadius.circular(30.0),
      selectedBorderColor: Colors.grey[300],
      selectedColor: Colors.white,
      fillColor: Color(0xFF9E8F47),
      color: Colors.black,
      splashColor: Colors.black.withOpacity(0.1),
      constraints: const BoxConstraints(minHeight: 40, minWidth: 100),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [Icon(icon1), const SizedBox(width: 8), Text(text1)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [Icon(icon2), const SizedBox(width: 8), Text(text2)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [Icon(icon3), const SizedBox(width: 8), Text(text3)],
          ),
        ),
      ],
    );
  }
}
