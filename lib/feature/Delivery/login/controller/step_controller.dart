import 'package:get/get.dart';

class StepController extends GetxController {
  var currentStep = 1.obs;
  final int totalSteps = 6;

  void setStep(int step) {
    if (step >= 1 && step <= totalSteps) {
      currentStep.value = step;
    }
  }

  void nextStep() {
    if (currentStep.value < totalSteps) {
      currentStep.value++;
    }
  }

  void prevStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
  }
}
