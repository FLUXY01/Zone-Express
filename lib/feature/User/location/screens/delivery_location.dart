import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/font.dart';
import '../../../../common/comm_button_yellow.dart';
import '../controller/save_as_controller.dart';
import '../widget/city_state_field.dart';
import '../widget/save_as_button.dart';

class DeliveryLocation extends StatefulWidget {
  const DeliveryLocation({super.key});

  @override
  State<DeliveryLocation> createState() => _DeliveryLocationState();
}

class _DeliveryLocationState extends State<DeliveryLocation> {
  final saveAsController = Get.put(SaveAsController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Delivery Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButtonYellow(label: "Save & Continue", onPressed: () {}),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel("Name"),
              buildTextField("Enter your name", nameController),
              SizedBox(height: screenHeight * 0.03),

              buildLabel("Mobile Number"),
              buildTextField("Enter mobile number", nameController),
              SizedBox(height: screenHeight * 0.01),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "We'll call this number to coordinate delivery",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              buildLabel("Flat, Housing no., Building, Apartment"),
              buildTextField(
                "Enter flat, housing no, building, apartment",
                nameController,
              ),
              SizedBox(height: screenHeight * 0.03),

              buildLabel("Area, street, sector"),
              buildTextField("Enter area, street, sector", nameController),
              SizedBox(height: screenHeight * 0.03),

              buildLabel("Pincode"),
              buildTextField("Enter pincode", nameController),
              SizedBox(height: screenHeight * 0.03),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CityStateFields(
                  cityController: cityController,
                  stateController: stateController,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Save as",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),

              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SaveAsButton(
                      label: "Home",
                      icon: Icons.home,
                      selected: saveAsController.selectedOption.value == "Home",
                      onTap: () =>
                          saveAsController.selectedOption.value = "Home",
                    ),
                    SaveAsButton(
                      label: "Work",
                      icon: Icons.work,
                      selected: saveAsController.selectedOption.value == "Work",
                      onTap: () =>
                          saveAsController.selectedOption.value = "Work",
                    ),
                    SaveAsButton(
                      label: "Other",
                      icon: Icons.location_city,
                      selected:
                          saveAsController.selectedOption.value == "Other",
                      onTap: () =>
                          saveAsController.selectedOption.value = "Other",
                    ),
                  ],
                );
              }),

              Obx(() {
                if (saveAsController.selectedOption.value == "Other") {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextField(
                      controller: saveAsController.otherPlaceController,
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
              SizedBox(
                height: screenHeight * 0.01,
              ), // so last element doesn't get hidden behind button
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade800,
          fontFamily: Tfonts.workSansFont,
        ),
      ),
    );
  }

  Widget buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ), // default border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blueGrey, // yellow border when focused
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
