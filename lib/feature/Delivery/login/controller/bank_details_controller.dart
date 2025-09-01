import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController accountHolderNameController =
      TextEditingController();

  final RxString bankName = ''.obs;
  final RxString accountNumber = ''.obs;
  final RxString ifscCode = ''.obs;
  final RxString accountHolderName = ''.obs;
  final RxString bankDetailsError = ''.obs;

  /// Validate bank details
  bool validateBankDetails() {
    if (bankName.value.isEmpty ||
        accountNumber.value.isEmpty ||
        ifscCode.value.isEmpty ||
        accountHolderName.value.isEmpty) {
      bankDetailsError.value = "Please fill all bank details";
      return false;
    }
    return true;
  }
}
