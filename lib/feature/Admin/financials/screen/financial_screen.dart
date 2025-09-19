import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zone_express/feature/Admin/financials/screen/payout_screen.dart';
import 'package:zone_express/feature/Admin/financials/widget/financial_row.dart';

import '../../../../utils/constants/font.dart';

class FinancialScreen extends StatefulWidget {
  const FinancialScreen({super.key});

  @override
  State<FinancialScreen> createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Financials",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "COD Reconciliation",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.check_circle_outline,
                  title: "Order #1234567890",
                  subtitle: "1234567890",
                  endText: "\$25.00",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.check_circle_outline,
                  title: "Order #1234567890",
                  subtitle: "1234567890",
                  endText: "\$25.00",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.check_circle_outline,
                  title: "Order #1234567890",
                  subtitle: "1234567890",
                  endText: "\$25.00",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.check_circle_outline,
                  title: "Order #1234567890",
                  subtitle: "1234567890",
                  endText: "\$25.00",
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Payments & Payouts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.payment_outlined,
                  title: "Payments",
                  endIcon: Icons.keyboard_arrow_right,
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.account_balance_wallet_outlined,
                  title: "Payouts",
                  endIcon: Icons.keyboard_arrow_right,
                  onTap: () {
                    Get.to(() => PayoutScreen());
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.refresh,
                  title: "Refunds",
                  endIcon: Icons.keyboard_arrow_right,
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Discrepancies",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.warning_amber,
                  title: "Order #6677889900",
                  subtitle: "Missing COD",
                  endText: "\$10.00",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.warning_amber,
                  title: "Order #0099887766",
                  subtitle: "Underpayment",
                  endText: "\$5.00",
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Promo & Penalties",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.percent_outlined,
                  title: "Apply Promo",
                  endIcon: Icons.keyboard_arrow_right,
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.attach_money,
                  title: "Apply Penalty",
                  endIcon: Icons.keyboard_arrow_right,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
