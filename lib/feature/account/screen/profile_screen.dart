import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/font.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/account_img/bell_icon.svg",
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(fontFamily: Tfonts.workSansFont, fontSize: 16),
              ),
              subtitle: const Text(
                "Manage notification settings",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/account_img/integrations_icon.svg",
              ),
              title: const Text(
                "Integrations",
                style: TextStyle(fontFamily: Tfonts.workSansFont, fontSize: 16),
              ),
              subtitle: const Text(
                "Connect your bussiness tools",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/account_img/api_icon.svg",
              ),
              title: const Text(
                "API Keys",
                style: TextStyle(fontFamily: Tfonts.workSansFont, fontSize: 16),
              ),
              subtitle: const Text(
                "Manage your API keys",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            SizedBox(height: screenHeight * 0.03),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Preferences",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/account_img/language_icon.svg",
              ),
              title: const Text(
                "Language",
                style: TextStyle(fontFamily: Tfonts.workSansFont, fontSize: 16),
              ),
              subtitle: FittedBox(
                child: const Text(
                  "Manage your Language preferences",
                  style: TextStyle(
                    fontFamily: Tfonts.workSansFont,
                    fontSize: 14,
                    color: Color(0xFF9E8F47),
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/account_img/currency_icon.svg",
              ),
              title: const Text(
                "Currency",
                style: TextStyle(fontFamily: Tfonts.workSansFont, fontSize: 16),
              ),
              subtitle: FittedBox(
                child: const Text(
                  "Manage your currency preferences",
                  style: TextStyle(
                    fontFamily: Tfonts.workSansFont,
                    fontSize: 14,
                    color: Color(0xFF9E8F47),
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
