import 'package:flutter/material.dart';
import 'package:zone_express/utils/constants/font.dart';
import 'package:zone_express/utils/constants/images.dart';

class RestrictedItemsBottomSheet extends StatelessWidget {
  const RestrictedItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "Restricted Items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Tfonts.plusJakartaSansFont,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "These items are bound to be seized by ZoneExpress and handed over to legal authorities.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: restrictedItems.length,
                    itemBuilder: (context, index) {
                      final item = restrictedItems[index];
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(item['image']!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// List of restricted items
final List<Map<String, String>> restrictedItems = [
  {"image": TImage.passport, "title": "Passport"},
  {"image": TImage.currency, "title": "Currency Notes & Coins"},
  {"image": TImage.cheque, "title": "Uncrossed Cheques"},
  {"image": TImage.battery, "title": "Batteries"},
  {"image": TImage.ring, "title": "Jewellery"},
  {"image": TImage.explosives, "title": "Explosives"},
  {"image": TImage.liquor, "title": "Liquor"},
  {"image": TImage.military, "title": "Military Equipment"},
  {"image": TImage.solvent, "title": "Industrial Solvents"},
  {"image": TImage.gem, "title": "Precious Stones"},

  // Add more later
];
