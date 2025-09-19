import 'package:flutter/material.dart';
import 'package:zone_express/feature/Admin/audit/screens/audit_screen.dart';
import 'package:zone_express/feature/Admin/couriers/screen/courier_screen.dart';
import 'package:zone_express/feature/Admin/dashboard/screen/admin_dashboard.dart';
import 'package:zone_express/feature/Admin/financials/screen/financial_screen.dart';

class MainScreenAdmin extends StatefulWidget {
  const MainScreenAdmin({super.key});

  @override
  State<MainScreenAdmin> createState() => _MainScreenAdminState();
}

class _MainScreenAdminState extends State<MainScreenAdmin> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const AdminDashboard(), // Home
    const CourierScreen(), // Orders
    FinancialScreen(), // TODO: Replace with AnalyticsScreen
    const Center(
      child: Text("Analytics Page"),
    ), // TODO: Replace with AccountScreen
    const AuditScreen(), // TODO: Replace with AccountScreen
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
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            activeIcon: Icon(Icons.local_shipping),
            label: "Couriers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            activeIcon: Icon(Icons.attach_money),
            label: "Financials",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: "Zones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: "Audit",
          ),
        ],
      ),
    );
  }
}
