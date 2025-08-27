import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final TextEditingController pickupAddressController = TextEditingController();
  final TextEditingController dropOffAddressController =
      TextEditingController();
  final TextEditingController packageSizeController = TextEditingController();
  final TextEditingController packageWeightController = TextEditingController();

  @override
  void onClose() {
    pickupAddressController.dispose();
    dropOffAddressController.dispose();
    packageSizeController.dispose();
    packageWeightController.dispose();
    super.onClose();
  }
}
