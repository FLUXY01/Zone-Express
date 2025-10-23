import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zone_express/common/comm_button_yellow.dart';
import 'package:zone_express/common/custom_textfield.dart';
import 'package:zone_express/utils/constants/images.dart';
import '../../../../utils/constants/font.dart';

class SecurePackageSection extends StatelessWidget {
  const SecurePackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                "Secure Your Package",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.plusJakartaSansFont,
                ),
              ),
              Icon(Icons.shield_sharp, color: Color(0xFFFFD700), size: 28),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        Divider(color: Colors.grey.shade300, thickness: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Package Value",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomTextField(
            labelText: "Enter Package Value",
            prefixIcon: Icons.attach_money,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: RichText(
            text: TextSpan(
              text:
                  "The maximum liability value for lost/damaged shipment will be as per the ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                fontFamily: Tfonts.workSansFont,
              ),
              children: [
                TextSpan(
                  text: "T&C of ZoneExpress",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                    fontFamily: Tfonts.workSansFont,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Items NOT allowed",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Tfonts.workSansFont,
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Show All",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
                fontFamily: Tfonts.workSansFont,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageCard(
              imagePath: TImage.fruit,
              title: "Perishables",
              width: screenWidth * 0.25,
            ),
            _buildImageCard(
              imagePath: TImage.passport,
              title: "Passport",
              width: screenWidth * 0.25,
            ),
            _buildImageCard(
              imagePath: TImage.hemp,
              title: "Drugs & Narcotics",
              width: screenWidth * 0.25,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Divider(color: Colors.grey.shade300, thickness: 2),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: CommonButtonYellow(label: "Next", onPressed: () {}),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  Widget _buildImageCard({
    required String imagePath,
    required String title,
    required double width,
  }) {
    return Column(
      children: [
        Container(
          width: width,
          height: width, // Square image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
