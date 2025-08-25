import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/custom_map.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tracking",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomMap(
              height: screenHeight * 0.3, // you can change this
              width: double.infinity,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Delivery Status Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Delivery Status",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),

          ListTile(
            leading: SvgPicture.asset(
              "assets/images/courier_img/truck_icon.svg",
            ),
            title: const Text("In Transit"),
            subtitle: const Text("Arriving in 20 minutes"),
          ),
          const ListTile(
            leading: Icon(Icons.inventory_2_outlined),
            title: Text("Package Picked Up"),
            visualDensity: VisualDensity(vertical: -2), // fine-tune spacing
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
          SizedBox(
            height: screenHeight * 0.03,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const VerticalDivider(
                thickness: 2,
                color: Color(0xFFDEDAC5),
                width: 20, // space occupied including padding
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          SizedBox(
            height: screenHeight * 0.02,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const VerticalDivider(
                thickness: 2,
                color: Color(0xFFDEDAC5),
                width: 20, // space occupied including padding
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text("In Transit"),
            visualDensity: VisualDensity(vertical: -2), // fine-tune spacing
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
          SizedBox(
            height: screenHeight * 0.03,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const VerticalDivider(
                thickness: 2,
                color: Color(0xFFDEDAC5),
                width: 20, // space occupied including padding
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          SizedBox(
            height: screenHeight * 0.02,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const VerticalDivider(
                thickness: 2,
                color: Color(0xFFDEDAC5),
                width: 20, // space occupied including padding
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.check),
            title: Text("Delivered"),
            visualDensity: VisualDensity(vertical: -2), // fine-tune spacing
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ],
      ),
    );
  }
}
