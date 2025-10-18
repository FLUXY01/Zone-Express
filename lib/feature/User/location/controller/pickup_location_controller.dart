import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import '../../../../modules/map/google_api_service.dart';

class PickupLocationController extends GetxController {
  GoogleMapController? mapController;
  late GoogleApiService apiService;

  var currentLatLng = Rxn<LatLng>();
  var currentAddress = "Fetching location...".obs;
  var isLoading = true.obs;
  var suggestions = <String>[].obs; // 🔹 For dropdown suggestions
  Timer? _debounce;

  final String googleApiKey =
      dotenv.env['GOOGLE_MAPS_API_KEY'] ?? ''; // 🔑 your key here

  @override
  void onInit() {
    super.onInit();
    apiService = GoogleApiService(Dio());
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentAddress.value = "Location services are disabled.";
      isLoading.value = false;
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentAddress.value = "Location permission denied.";
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      currentAddress.value = "Location permission permanently denied.";
      isLoading.value = false;
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    updateAddress(position.latitude, position.longitude);
  }

  Future<void> updateAddress(double lat, double lng) async {
    try {
      final latlng = "$lat,$lng";
      final response = await apiService.getAddressFromLatLng(
        latlng,
        googleApiKey,
      );

      if (response.response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          currentLatLng.value = LatLng(lat, lng);
          currentAddress.value = data['results'][0]['formatted_address'];
        } else {
          currentAddress.value = "No address found.";
        }
      } else {
        currentAddress.value =
            "Error fetching address: ${response.response.statusCode}";
      }
    } catch (e) {
      currentAddress.value = "Failed to fetch address: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraMove(CameraPosition position) {
    currentLatLng.value = position.target;
  }

  void onCameraIdle() {
    if (currentLatLng.value != null) {
      updateAddress(
        currentLatLng.value!.latitude,
        currentLatLng.value!.longitude,
      );
    }
  }

  void onSearchChanged(String query) {
    // cancel any ongoing debounce timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // if text is empty, clear immediately and stop
    if (query.trim().isEmpty) {
      suggestions.clear();
      return;
    }

    // debounce for smoother typing
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchSuggestions(query.trim());
    });
  }

  Future<void> fetchSuggestions(String input) async {
    // prevent unnecessary API calls for empty input
    if (input.isEmpty) {
      suggestions.clear();
      return;
    }

    try {
      final response = await apiService.getPlaceSuggestions(
        input,
        googleApiKey,
        "country:in", // optional
      );

      if (response.response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'OK') {
          suggestions.value = List<String>.from(
            data['predictions'].map((p) => p['description']),
          );
        } else {
          suggestions.clear();
        }
      } else {
        suggestions.clear();
      }
    } catch (e) {
      suggestions.clear();
    }
  }
}
