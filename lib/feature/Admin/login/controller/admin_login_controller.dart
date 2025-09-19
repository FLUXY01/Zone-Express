import 'package:flutter/material.dart';
import 'package:get/get.dart';

class adminLoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;

  bool isValidateInputs() {
    bool isValid = true;

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
    return isValid;
  }
}
