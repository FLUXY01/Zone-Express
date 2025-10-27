import 'package:flutter/material.dart';
import 'package:zone_express/common/custom_textfield.dart';
import 'package:zone_express/utils/constants/font.dart';

class SuitCaseContent extends StatefulWidget {
  final String? imagePath; // <-- Nullable image, optional

  const SuitCaseContent({super.key, this.imagePath});

  @override
  State<SuitCaseContent> createState() => _SuitCaseContentState();
}

class _SuitCaseContentState extends State<SuitCaseContent> {
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController breadthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    lengthController.dispose();
    breadthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),

        // 🖼️ Show image only if provided
        if (widget.imagePath != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset(
              widget.imagePath!,
              width: screenWidth * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
        ],

        // 📏 Dimensions Label
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Package Dimensions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),

        // 📦 Dimension Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  controller: lengthController,
                  labelText: 'L',
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  controller: breadthController,
                  labelText: 'B',
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  controller: heightController,
                  labelText: 'H',
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: screenHeight * 0.015),

        // ⚖️ Weight Label
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Package Weight",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),

        // ⚖️ Weight Input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomTextField(
            prefixIcon: Icons.monitor_weight_outlined,
            labelText: "Enter Package Weight",
            keyboardType: TextInputType.number,
            controller: weightController,
          ),
        ),
      ],
    );
  }
}
