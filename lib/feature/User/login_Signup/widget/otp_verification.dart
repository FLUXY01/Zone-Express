import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/feature/User/dashboard/screens/dashboard_screen.dart';
import 'package:zone_express/feature/User/main_screen_user.dart';

class OtpBottomSheet extends StatefulWidget {
  final String phoneNumber;
  const OtpBottomSheet({super.key, required this.phoneNumber});

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;

  Timer? _timer;
  int _start = 60; // 1 minute timer

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _start = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  void _resendOtp() {
    // 👇 Call your backend here
    print("Resend OTP API called for ${widget.phoneNumber}");
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 380,
        child: Column(
          children: [
            // 🔙 Top Row with Back Button + Handle Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context), // Close bottom sheet
                ),
                const Spacer(),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ Center Aligned Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "OTP is sent to +${widget.phoneNumber}",
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  /// OTP Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      6,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 45,
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          onChanged: (value) => _onOtpChanged(value, index),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _start > 0
                      ? Text(
                          "Resend in 00:${_start.toString().padLeft(2, '0')}",
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        )
                      : GestureDetector(
                          onTap: _resendOtp,
                          child: const Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: CommonButtonYellow(
                      label: "Get OTP",
                      onPressed: () {
                        String otp = _otpControllers.map((c) => c.text).join();
                        print("Entered OTP: $otp");
                        Get.offAll(() => const MainScreenUser());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Function to show the BottomSheet
void showOtpBottomSheet(BuildContext context, String phoneNumber) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => OtpBottomSheet(phoneNumber: phoneNumber),
  );
}
