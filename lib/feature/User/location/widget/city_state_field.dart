import 'package:flutter/material.dart';

class CityStateFields extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController stateController;

  const CityStateFields({
    super.key,
    required this.cityController,
    required this.stateController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // City Field
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "City",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E9F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    hintText: "City",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // State Field
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "State",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E9F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: stateController,
                  decoration: const InputDecoration(
                    hintText: "State",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
