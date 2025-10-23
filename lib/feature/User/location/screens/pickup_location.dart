import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/common_button_grey.dart';
import '../controller/pickup_location_controller.dart';

class PickupLocation extends StatelessWidget {
  const PickupLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PickupLocationController());
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Pickup Location',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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

            // Red pin marker at center
            const Center(
              child: Icon(Icons.location_pin, color: Colors.red, size: 48),
            ),

            // Address card at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Select the Pickup Location",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.currentAddress.value,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: CommonButtonYellow(
                        label: "Save Location",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: CommonButtonGrey(
                        label: "Add address manually",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
