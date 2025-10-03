import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zone_express/utils/constants/font.dart';

class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: screenHeight * 0.35,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SUPPORT TICKETS RAISED BY YOU",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Icon(
                    Icons.live_help_outlined,
                    size: 80,
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Center(
                  child: Text(
                    "No Queries Yet",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Seems like all is good",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[400],
                      fontFamily: Tfonts.workSansFont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
