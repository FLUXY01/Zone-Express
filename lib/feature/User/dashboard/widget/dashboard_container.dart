import 'package:flutter/material.dart';
import '../../../../utils/constants/images.dart';

class DashCard extends StatelessWidget {
  final VoidCallback onTap; // 👈 required tap callback

  const DashCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient shadow behind card
        Positioned(
          left: 16,
          right: 16,
          bottom: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFFF5F2E5).withOpacity(0.55),
                ],
              ),
            ),
          ),
        ),

        // Main Card wrapped with InkWell
        GestureDetector(
          onTap: onTap, // 👈 handle tap
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Your World. Our Route.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3440),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "18,000+ Pincodes",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                // Image Section
                Image.asset(
                  TImage.box,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
