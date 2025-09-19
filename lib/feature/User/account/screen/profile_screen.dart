import 'package:flutter/material.dart';
import '../../../../utils/constants/font.dart';

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
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            ListTile(
              leading: const Icon(Icons.person_outline, size: 30),
              title: const Text(
                "Name",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "Vimanyu J",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Icon(Icons.phone_in_talk_outlined, size: 30),
              title: const Text(
                "Phone Number",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "+91 9876543210",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Icon(Icons.email_outlined, size: 30),
              title: const Text(
                "Email",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "vimanyujain07@gmail.com",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.person_outline, size: 30),
                  Icon(Icons.check, size: 15),
                ],
              ),
              title: const Text(
                "Gender",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "Male",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined, size: 30),
              title: const Text(
                "Date of Birth",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "20/10/2000",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium_outlined, size: 30),
              title: const Text(
                "Member Since",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "January 2023",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.05,
            ),
            ListTile(
              leading: Icon(Icons.emergency_outlined, size: 30),
              title: const Text(
                "Emergency Contact",
                style: TextStyle(
                  fontFamily: Tfonts.plusJakartaSansFont,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                "+91 9876543210",
                style: TextStyle(
                  fontFamily: Tfonts.workSansFont,
                  fontSize: 14,
                  color: Color(0xFF9E8F47),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
