import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/User/location/screens/save_location_page.dart';
import '../controller/pickup_location_controller.dart';

class LocationSearchPage extends StatelessWidget {
  final controller = Get.put(PickupLocationController());

  LocationSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // 🔹 Search TextField + “Use current location”
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: controller.onSearchChanged,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.yellow[700],
                      size: 22,
                    ),
                    hintText: "Enter location name",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6C6C6C),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFDADADA),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.yellow,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔹 Use current location
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SaveLocationPage());
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.my_location, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Text(
                        "Use current location",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // 🔹 Dropdown suggestions
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Obx(() {
                final items = controller.suggestions;
                if (items.isEmpty)
                  return const SizedBox(); // hide when no results

                return Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(maxHeight: 220),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final suggestion = items[index];
                        return ListTile(
                          title: Text(
                            suggestion,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            controller.currentAddress.value = suggestion;
                            controller.suggestions.clear();
                            FocusScope.of(context).unfocus();
                          },
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
