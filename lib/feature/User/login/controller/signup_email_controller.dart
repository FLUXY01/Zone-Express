import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpEmailController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxString usernameError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;

  bool isValidateInputs() {
    bool isValid = true;

    // Username validation
    if (usernameController.text.trim().isEmpty) {
      usernameError.value = "Username cannot be empty";
      isValid = false;
    } else {
      usernameError.value = '';
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
    } else {
      confirmPasswordError.value = '';
    }

    return isValid;
  }

  void signup() {
    if (isValidateInputs()) {
      // Call API or backend auth here
      Get.snackbar(
        "Success",
        "Login successful",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Validation Error",
          message: "Please fix the errors before continuing.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          margin: const EdgeInsets.all(12),
          borderRadius: 12,
          icon: const Icon(Icons.error_outline, color: Colors.white),
          duration: const Duration(seconds: 3),
          isDismissible: true,
        ),
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
