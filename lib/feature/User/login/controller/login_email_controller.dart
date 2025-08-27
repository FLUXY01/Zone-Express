import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginEmailController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Reactive error messages
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;

  /// Validate email and password
  bool validateInputs() {
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

  /// Handle login logic
  void login() {
    if (validateInputs()) {
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
