import 'package:flutter/material.dart';
import 'package:get/get.dart';

class deliverySignUpController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final RxString fullNameError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString phoneError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;
  final RxString otpError = ''.obs;

  bool isValidateInputs() {
    bool isValid = true;

    // Full Name validation
    if (fullNameController.text.trim().isEmpty) {
      fullNameError.value = "Full Name cannot be empty";
      isValid = false;
    } else {
      fullNameError.value = '';
    }

    // Email validation
    if (emailController.text.trim().isEmpty) {
      emailError.value = "Email cannot be empty";
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = "Enter a valid email";
      isValid = false;
    } else {
      emailError.value = '';
    }

    // Phone validation
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = "Phone number cannot be empty";
      isValid = false;
    } else if (!GetUtils.isPhoneNumber(phoneController.text.trim())) {
      phoneError.value = "Enter a valid phone number";
      isValid = false;
    } else {
      phoneError.value = '';
    }

    // Password validation
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = "Password cannot be empty";
      isValid = false;
    } else if (passwordController.text.length < 8) {
      passwordError.value = "Password must be at least 8 characters";
      isValid = false;
    } else {
      passwordError.value = '';
    }

    // Confirm Password validation
    if (confirmPasswordController.text.trim().isEmpty) {
      confirmPasswordError.value = "Confirm Password cannot be empty";
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError.value = "Passwords do not match";
      isValid = false;
    }

    if (otpController.text.trim().isEmpty) {
      otpError.value = "OTP cannot be empty";
      isValid = false;
    } else if (!RegExp(r'^\d+$').hasMatch(otpController.text.trim())) {
      otpError.value = "OTP should contain only numbers";
      isValid = false;
    } else {
      otpError.value = '';
    }
    return isValid;
  }
}
