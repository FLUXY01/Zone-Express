import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zone_express/feature/User/get%20help/widget/support_ticket_card.dart';

import '../../../../utils/constants/font.dart';

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  bool showMoreOptions = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.plusJakartaSansFont,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 1, color: Colors.grey[300]),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      "FREQUENTLY ASKED QUESTIONS",
                      style: TextStyle(
                        fontFamily: Tfonts.plusJakartaSansFont,
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 8.0,
                        leading: Icon(FontAwesome.cube, size: 25),
                        title: Text(
                          "Get Shipment Status",
                          style: TextStyle(
                            fontFamily: Tfonts.plusJakartaSansFont,
                            fontSize: 14,
                            color: Color(0xFF9E8F47),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 8.0,
                        leading: Icon(
                          MaterialCommunityIcons.card_account_details_outline,
                          size: 25,
                        ),
                        title: Text(
                          "Update destination and contact details",
                          style: TextStyle(
                            fontFamily: Tfonts.plusJakartaSansFont,
                            fontSize: 14,
                            color: Color(0xFF9E8F47),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    showMoreOptions
                        ? Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 8.0,
                                leading: Icon(Icons.keyboard_return, size: 25),
                                title: Text(
                                  "Manage Returns",
                                  style: TextStyle(
                                    fontFamily: Tfonts.plusJakartaSansFont,
                                    fontSize: 14,
                                    color: Color(0xFF9E8F47),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 8.0,
                                leading: Icon(
                                  MaterialCommunityIcons.cash,
                                  size: 25,
                                ),
                                title: Text(
                                  "Get Payment & Refund Details",
                                  style: TextStyle(
                                    fontFamily: Tfonts.plusJakartaSansFont,
                                    fontSize: 14,
                                    color: Color(0xFF9E8F47),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 8.0,
                                leading: Icon(Icons.support_agent, size: 25),
                                title: Text(
                                  "Contact Support",
                                  style: TextStyle(
                                    fontFamily: Tfonts.plusJakartaSansFont,
                                    fontSize: 14,
                                    color: Color(0xFF9E8F47),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showMoreOptions = false;
                                  });
                                },
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 8.0,
                                  leading: Icon(
                                    MaterialCommunityIcons.dots_horizontal,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "Less",
                                    style: TextStyle(
                                      fontFamily: Tfonts.plusJakartaSansFont,
                                      fontSize: 14,
                                      color: Color(0xFF9E8F47),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                showMoreOptions = true;
                              });
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8.0,
                              leading: Icon(
                                MaterialCommunityIcons.dots_horizontal,
                                size: 25,
                              ),
                              title: Text(
                                "More",
                                style: TextStyle(
                                  fontFamily: Tfonts.plusJakartaSansFont,
                                  fontSize: 14,
                                  color: Color(0xFF9E8F47),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey[100],
                thickness: 10,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(height: screenHeight * 0.02),
              SupportTicketCard(),
            ],
          ),
        ),
      ),
    );
  }
}
