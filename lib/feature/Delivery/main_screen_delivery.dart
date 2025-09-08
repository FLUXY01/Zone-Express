import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/Delivery/dashboard/screens/dashboard_delivery.dart';
import 'package:zone_express/feature/Delivery/earnings/screen/earnings_screen.dart';
import 'package:zone_express/feature/Delivery/jobs/screen/jobs_screen.dart';
import 'package:zone_express/feature/Delivery/profile/screens/profile_screen.dart';

import 'more/screen/help_safety_screen.dart';

class MainScreenDelivery extends StatefulWidget {
  const MainScreenDelivery({super.key});

  @override
  State<MainScreenDelivery> createState() => _MainScreenDeliveryState();
}

class _MainScreenDeliveryState extends State<MainScreenDelivery> {
  int _selectedIndex = 0;

  // Pages for each tab (no actual page for "More")
  final List<Widget> _pages = [
    const DashboardScreenDelivery(), // Home
    const JobsScreen(), // Jobs
    const EarningsScreen(), // Earnings
    const ProfileScreen(), // Profile
    const SizedBox(), // Placeholder for More
  ];

  void _onItemTapped(int index) {
    if (index == 4) {
      // If "More" tapped → show popup
      _showMoreOptions(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFF8F6ED),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.health_and_safety_outlined,
                  color: Color(0xFF9E8A47),
                ),
                title: const Text(
                  "Help & Safety",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Get.off(() => const HelpSafetyScreen());
                  // Navigate to Help & Safety screen
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF9E8A47),
                ),
                title: const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Notifications screen
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // show selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF5F2E5),
        selectedItemColor: Colors.black87,
        unselectedItemColor: const Color(0xFF9E8F47).withOpacity(0.6),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            activeIcon: Icon(Icons.attach_money),
            label: "Earnings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            activeIcon: Icon(Icons.menu),
            label: "More",
          ),
        ],
      ),
    );
  }
}
