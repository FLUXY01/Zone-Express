import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zone_express/utils/constants/images.dart';
import 'package:zone_express/feature/User/orders/widget/package_card.dart';

class PackageTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const PackageTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final types = [
      {
        "title": "Envelope / Pouch",
        "image": TImage.envelope,
        "value": "Envelope",
      },
      {"title": "Box / Carton", "image": TImage.carton, "value": "Box"},
      {
        "title": "Suitcase / Luggage",
        "image": TImage.luggage,
        "value": "Suitcase",
      },
      {
        "title": "Bagpack / Hand Bag",
        "image": TImage.bagpack,
        "value": "Bagpack",
      },
      {
        "title": "Others",
        "icon": MaterialCommunityIcons.cube_outline,
        "value": "others",
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: types.map((type) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: screenWidth * 0.38,
              height: screenHeight * 0.22,
              child: PackageCard(
                title: type["title"] as String,
                imagePath: type["image"] as String?,
                icon: type["icon"] as IconData?,
                isSelected: selectedType == type["value"],
                onTap: () => onTypeSelected(type["value"] as String),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
