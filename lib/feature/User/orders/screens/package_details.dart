import 'package:flutter/material.dart';
import 'package:zone_express/utils/constants/font.dart';
import '../../../../utils/constants/images.dart';
import '../widget/package_content_selector.dart';
import '../widget/secure_package_section.dart';
import '../widget/step_progress.dart';
import '../widget/package_type_selector.dart';
import '../widget/package_size_selector.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({super.key});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  int currentStep = 1;
  String selectedType = "";
  String selectedSize = "";
  List<String> selectedContents = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send a Package',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: StepProgress(currentStep: currentStep),
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Describe Your Package",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // 📦 Package Type Selection
              PackageTypeSelector(
                selectedType: selectedType,
                onTypeSelected: (type) {
                  setState(() {
                    selectedType = type;
                    selectedSize = "";
                    selectedContents.clear();
                  });
                },
              ),

              // 📏 Package Size Selection
              if (selectedType == "Envelope" ||
                  selectedType == "Box" ||
                  selectedType == "Bagpack") ...[
                PackageSizeSelector(
                  selectedType: selectedType,
                  selectedSize: selectedSize,
                  onSizeSelected: (size) {
                    setState(() {
                      selectedSize = size;
                      selectedContents.clear();
                    });
                  },
                ),

                // 🎒 Package Contents Selection
                if (selectedType == "Envelope" && selectedSize.isNotEmpty)
                  PackageContentsSelector(
                    selectedSize: selectedSize,
                    selectedContents: selectedContents,
                    onContentToggled: (content) {
                      setState(() {
                        if (selectedContents.contains(content)) {
                          selectedContents.remove(content);
                        } else {
                          selectedContents.add(content);
                        }
                      });
                    },
                  ),
              ],
              if (selectedContents.isNotEmpty) ...[
                SizedBox(height: screenHeight * 0.03),
                const SecurePackageSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
