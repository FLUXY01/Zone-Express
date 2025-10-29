import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  final String day;
  final String date;
  final String month;
  final bool isSelected;
  final VoidCallback onTap;

  const DateButton({
    super.key,
    required this.day,
    required this.date,
    required this.month,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[100]! : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.yellow[300]! : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.yellow[200]!,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.yellow[700] : Colors.grey[700],
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isSelected ? Colors.yellow[700] : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              month,
              style: TextStyle(
                color: isSelected ? Colors.yellow[700] : Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
