import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequiredDocumentController extends GetxController {
  final Rx<File?> aadharCardImage = Rx<File?>(null);
  final Rx<File?> drivingLicenseImage = Rx<File?>(null);
  final Rx<File?> profilePhotoImage = Rx<File?>(null);
  final Rx<File?> insuranceImage = Rx<File?>(null);
  final RxString documentError = ''.obs;

  /// Pick Aadhaar card image
  Future<void> pickAadharCard() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      aadharCardImage.value = File(pickedFile.path);
      documentError.value = ''; // Clear error once selected
    }
  }

  Future<void> pickDrivingLicense() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      aadharCardImage.value = File(pickedFile.path);
      documentError.value = ''; // Clear error once selected
    }
  }

  Future<void> pickProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profilePhotoImage.value = File(pickedFile.path);
      documentError.value = ''; // Clear error once selected
    }
  }

  Future<void> pickInsurance() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      insuranceImage.value = File(pickedFile.path);
      documentError.value = ''; // Clear error once selected
    }
  }

  /// Validate if Aadhaar card is uploaded
  bool validateAadharCard() {
    if (aadharCardImage.value == null) {
      documentError.value = "Please upload your Aadhaar card";
      return false;
    }
    return true;
  }

  /// Validate if Driving License is uploaded
  bool validateDrivingLicense() {
    if (drivingLicenseImage.value == null) {
      documentError.value = "Please upload your Driving License";
      return false;
    }
    return true;
  }

  bool validateProfilePhoto() {
    if (profilePhotoImage.value == null) {
      documentError.value = "Please upload your Profile Photo";
      return false;
    }
    return true;
  }

  bool validateInsurance() {
    if (insuranceImage.value == null) {
      documentError.value = "Please upload your Insurance Document";
      return false;
    }
    return true;
  }

  void clearProfilePhoto() {
    profilePhotoImage.value = null;
  }

  void clearDrivingLicense() {
    drivingLicenseImage.value = null;
  }

  /// Clear Aadhaar card
  void clearAadharCard() {
    aadharCardImage.value = null;
  }

  void clearInsurance() {
    insuranceImage.value = null;
  }
}
