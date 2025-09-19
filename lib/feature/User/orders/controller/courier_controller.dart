import 'package:get/get.dart';

class CourierController extends GetxController {
  var selectedCourier = "".obs;

  void selectCourier(String courierName) {
    selectedCourier.value = courierName;
  }
}
