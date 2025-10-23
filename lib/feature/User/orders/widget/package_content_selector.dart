import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zone_express/utils/constants/images.dart';
import 'package:zone_express/feature/User/orders/widget/package_card.dart';
import 'package:zone_express/utils/constants/font.dart';

class PackageContentsSelector extends StatelessWidget {
  final String selectedSize;
  final List<String> selectedContents;
  final Function(String) onContentToggled;

  const PackageContentsSelector({
    super.key,
    required this.selectedSize,
    required this.selectedContents,
    required this.onContentToggled,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final contents = selectedSize == 'XS'
        ? [
            {
              "title": "Books & Documents",
              "image": TImage.book,
              "key": "books",
            },
            {
              "title": "Electronics",
              "image": TImage.phone,
              "key": "electronics",
            },
            {
              "title": "Others",
              "icon": MaterialCommunityIcons.dots_horizontal_circle_outline,
              "key": "others",
            },
          ]
        : [
            {
              "title": "Books & Documents",
              "image": TImage.book,
              "key": "books",
            },
            {"title": "Clothes", "image": TImage.clothes, "key": "clothes"},
            {"title": "Consumables", "image": TImage.food, "key": "food"},
            {
              "title": "Electronics",
              "image": TImage.phone,
              "key": "electronics",
            },
            {"title": "Household Items", "image": TImage.lid, "key": "lid"},
            {
              "title": "Sports Equipment",
              "image": TImage.football,
              "key": "football",
            },
            {
              "title": "Others",
              "icon": MaterialCommunityIcons.dots_horizontal_circle_outline,
              "key": "others",
            },
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Package Contents",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
              Text(
                selectedSize == "XS"
                    ? "${selectedContents.length}/3 selected"
                    : "${selectedContents.length}/7 selected",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: contents.map((content) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: screenWidth * 0.38,
                  height: screenHeight * 0.22,
                  child: PackageCard(
                    title: content["title"] as String,
                    imagePath: content["image"] as String?,
                    icon: content["icon"] as IconData?,
                    onTap: () => onContentToggled(content["key"] as String),
                    isSelected: selectedContents.contains(content["key"]),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
