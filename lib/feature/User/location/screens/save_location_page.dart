import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import '../../../../utils/constants/font.dart';
import '../controller/pickup_location_controller.dart';
import '../controller/save_as_controller.dart';
import '../widget/save_as_button.dart';

class SaveLocationPage extends StatefulWidget {
  const SaveLocationPage({super.key});

  @override
  State<SaveLocationPage> createState() => _SaveLocationPageState();
}

class _SaveLocationPageState extends State<SaveLocationPage> {
  final controller = Get.put(PickupLocationController());
  final saveAsController = Get.put(SaveAsController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController houseController = TextEditingController();

  bool _bottomSheetVisible = false;

  @override
  void initState() {
    super.initState();

    // Auto-show bottom sheet when address is available
    ever(controller.currentAddress, (_) {
      if (!_bottomSheetVisible &&
          !controller.isLoading.value &&
          controller.currentAddress.value.isNotEmpty) {
        setState(() => _bottomSheetVisible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            if (controller.currentLatLng.value != null)
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLatLng.value!,
                  zoom: 17,
                ),
                onMapCreated: controller.onMapCreated,
                onCameraMove: controller.onCameraMove,
                onCameraIdle: controller.onCameraIdle,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
              ),
            Positioned(
              top: 40, // distance from top
              left: 16, // distance from left
              child: CircleAvatar(
                backgroundColor: Colors.white, // optional circle background
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  iconSize: 24,
                  padding:
                      EdgeInsets.zero, // remove extra padding inside button
                  constraints:
                      const BoxConstraints(), // remove default constraints
                ),
              ),
            ),

            /// Red pin marker at the center
            const Center(
              child: Icon(Icons.location_pin, color: Colors.red, size: 48),
            ),

            /// ✅ Bottom sheet overlay (appears without blocking UI)
            if (_bottomSheetVisible)
              DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.25,
                maxChildSize: 0.8,
                snap: true,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 4,
                              width: 40,
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Save Pickup Location",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Current address
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.currentAddress.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "Full Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),

                          const Text(
                            "Phone Number",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter phone number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "House / Apartment No.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: houseController,
                            decoration: InputDecoration(
                              hintText: "Enter house or apartment number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Save as",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontFamily: Tfonts.plusJakartaSansFont,
                            ),
                          ),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SaveAsButton(
                                  label: "Home",
                                  icon: Icons.home,
                                  selected:
                                      saveAsController.selectedOption.value ==
                                      "Home",
                                  onTap: () =>
                                      saveAsController.selectedOption.value =
                                          "Home",
                                ),
                                SaveAsButton(
                                  label: "Work",
                                  icon: Icons.work,
                                  selected:
                                      saveAsController.selectedOption.value ==
                                      "Work",
                                  onTap: () =>
                                      saveAsController.selectedOption.value =
                                          "Work",
                                ),
                                SaveAsButton(
                                  label: "Other",
                                  icon: Icons.location_city,
                                  selected:
                                      saveAsController.selectedOption.value ==
                                      "Other",
                                  onTap: () =>
                                      saveAsController.selectedOption.value =
                                          "Other",
                                ),
                              ],
                            );
                          }),

                          // If "Other" is selected, show additional TextField
                          Obx(() {
                            if (saveAsController.selectedOption.value ==
                                "Other") {
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: TextField(
                                  controller:
                                      saveAsController.otherPlaceController,
                                  decoration: InputDecoration(
                                    hintText: "e.g. Friend's place",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: CommonButtonYellow(
                              label: "Save Location",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      }),
    );
  }
}
