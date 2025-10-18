import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SaveAsController extends GetxController {
  /// Selected option: "Home", "Work", or "Other"
  var selectedOption = "".obs;

  /// Controller for the "Other" text field
  final TextEditingController otherPlaceController = TextEditingController();

  /// Helper method to select an option
  void selectOption(String option) {
    selectedOption.value = option;

    // Clear the "Other" text field if not selected
    if (option != "Other") {
      otherPlaceController.clear();
    }
  }

  @override
  void onClose() {
    otherPlaceController.dispose();
    super.onClose();
  }
}
