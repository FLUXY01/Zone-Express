import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DropOffController extends GetxController {
  final Rx<File?> signatureImage = Rx<File?>(null);
  final Rx<File?> parcelImage = Rx<File?>(null);

  final TextEditingController otpController = TextEditingController();
  final TextEditingController nameReceiverController = TextEditingController();

  // Separate error observables
  final RxString signatureError = ''.obs;
  final RxString parcelError = ''.obs;
  final RxString nameError = ''.obs;
  final RxString otpError = ''.obs;

  Future<void> pickSignatureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      signatureImage.value = File(pickedFile.path);
      signatureError.value = ''; // clear error
    }
  }

  Future<void> pickParcelImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      parcelImage.value = File(pickedFile.path);
      parcelError.value = ''; // clear error
    }
  }

  bool validateSignatureImage() {
    if (signatureImage.value == null) {
      signatureError.value = "Please upload your Aadhaar card";
      return false;
    }
    return true;
  }

  bool validateParcelImage() {
    if (parcelImage.value == null) {
      parcelError.value = "Please upload the parcel image";
      return false;
    }
    return true;
  }

  void clearSignatureImage() => signatureImage.value = null;
  void clearParcelImage() => parcelImage.value = null;

  bool isValidateInputs() {
    bool isValid = true;

    if (nameReceiverController.text.trim().isEmpty) {
      nameError.value = "Full Name cannot be empty";
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (otpController.text.trim().isEmpty) {
      otpError.value = "OTP cannot be empty";
      isValid = false;
    } else {
      otpError.value = '';
    }

    if (!validateSignatureImage()) isValid = false;
    if (!validateParcelImage()) isValid = false;

    return isValid;
  }
}
