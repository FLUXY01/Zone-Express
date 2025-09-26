import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/feature/User/dashboard/widget/dashboard_container.dart';
import 'package:zone_express/feature/User/orders/screens/package_details.dart';
import 'package:zone_express/feature/User/orders/widget/button_row.dart';
import '../../../../utils/constants/font.dart';

class ToMeScreen extends StatefulWidget {
  const ToMeScreen({super.key});

  @override
  State<ToMeScreen> createState() => _ToMeScreenState();
}

class _ToMeScreenState extends State<ToMeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ButtonRow(
            text1: "All",
            text2: "Couriers",
            text3: "Others",
            icon1: Icons.grid_view,
            icon2: Icons.local_shipping_outlined,
            icon3: Icons.shopping_cart_outlined,
            onSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (selectedIndex == 0) {
                  return AllContentWidget();
                } else if (selectedIndex == 1) {
                  return CouriersContentWidget();
                } else {
                  return OthersContentWidget();
                }
              },
            ),
          ),
        ],
      ),

      // ✅ Correct place for FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 🔹 Header Row
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "SELECT A SERVICE",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context); // or Get.back()
                                  },
                                ),
                              ],
                            ),
                          ),

                          const Divider(height: 1, color: Colors.black12),

                          // 🔹 Your DashCard inside the same box
                          GestureDetector(
                            child: DashCard(
                              onTap: () {
                                Get.to(() => const PackageDetails());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: const Text("Book Now"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.yellow[600],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// Placeholder widgets for content
class AllContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _emptyState();
  }
}

class CouriersContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _emptyState();
  }
}

class OthersContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _emptyState();
  }
}

Widget _emptyState() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.center,
        child: Text(
          'Oops!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          'no orders found',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
      ),
    ],
  );
}
