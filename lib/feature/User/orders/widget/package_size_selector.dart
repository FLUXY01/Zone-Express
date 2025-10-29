import 'package:flutter/material.dart';
import 'package:zone_express/feature/User/orders/widget/package_size_card.dart';
import 'package:zone_express/utils/constants/font.dart';

class PackageSizeSelector extends StatelessWidget {
  final String selectedType;
  final String selectedSize;
  final Function(String) onSizeSelected;

  const PackageSizeSelector({
    super.key,
    required this.selectedType,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.03),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Choose Package Size",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // 🔹 Conditional logic
        if (selectedType == "others")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: PackageSizeCard(
                        label: "XS",
                        weightRange: "upto 0.5 KG",
                        isSelected: selectedSize == "XS",
                        onTap: () => onSizeSelected("XS"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: PackageSizeCard(
                        label: "S",
                        weightRange: "0.5 KG - 2 KG",
                        isSelected: selectedSize == "S",
                        onTap: () => onSizeSelected("S"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              SizedBox(
                height: screenHeight * 0.11,
                width: screenWidth * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: PackageSizeCard(
                    label: "L",
                    weightRange: "2+ KG",
                    isSelected: selectedSize == "L",
                    onTap: () => onSizeSelected("L"),
                  ),
                ),
              ),
            ],
          )
        else
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: PackageSizeCard(
                    label: selectedType == "Envelope" ? "XS" : "M",
                    weightRange: selectedType == "Envelope"
                        ? "upto 0.5 KG"
                        : "0.5 KG - 2 KG",
                    isSelected:
                        selectedSize ==
                        (selectedType == "Envelope" ? "XS" : "M"),
                    onTap: () =>
                        onSizeSelected(selectedType == "Envelope" ? "XS" : "M"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: PackageSizeCard(
                    label: selectedType == "Envelope" ? "S" : "L",
                    weightRange: selectedType == "Envelope"
                        ? "0.5 KG - 2 KG"
                        : "2+ KG",
                    isSelected:
                        selectedSize ==
                        (selectedType == "Envelope" ? "S" : "L"),
                    onTap: () =>
                        onSizeSelected(selectedType == "Envelope" ? "S" : "L"),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
