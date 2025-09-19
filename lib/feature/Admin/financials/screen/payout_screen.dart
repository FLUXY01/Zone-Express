import 'package:flutter/material.dart';
import 'package:zone_express/feature/Admin/financials/widget/financial_row.dart';
import 'package:zone_express/utils/constants/font.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payments & Payouts",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Tfonts.workSansFont,
          ),
        ),
        centerTitle: true,
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
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Payouts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Tfonts.plusJakartaSansFont,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
                SizedBox(height: screenHeight * 0.03),
                FinancialRow(
                  leadingIcon: Icons.local_shipping_outlined,
                  title: "Courier Payouts",
                  subtitle: "1234567890",
                  endText: "\$ 1,234.56",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
