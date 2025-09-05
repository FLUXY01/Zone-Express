import 'package:flutter/material.dart';
import 'package:zone_express/feature/Delivery/dashboard/screens/dashboard_delivery.dart';
import 'package:zone_express/feature/Delivery/jobs/screen/jobs_screen.dart';

class MainScreenDelivery extends StatefulWidget {
  const MainScreenDelivery({super.key});

  @override
  State<MainScreenDelivery> createState() => _MainScreenDeliveryState();
}

class _MainScreenDeliveryState extends State<MainScreenDelivery> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const DashboardScreenDelivery(), // Home
    const JobsScreen(), // jobs
    const Center(
      child: Text("Analytics Page"),
    ), // TODO: Replace with AnalyticsScreen
    const Text("data"), // TODO: Replace with AccountScreen
    const Text("data"), // TODO: Replace with More
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // show selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF5F2E5), // light cream bg
        selectedItemColor: Colors.black87, // gold/olive for selected
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
