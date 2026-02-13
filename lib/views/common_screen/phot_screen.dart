import 'package:astrologer_app/views/common_screen/agreement_page.dart';
import 'package:flutter/material.dart';

class FullImagePage extends StatelessWidget {
  const FullImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔥 Full Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/amabalam3.jpg',
              fit: BoxFit.cover,
            ),
          ),

          /// 🌑 Dark Overlay for better button visibility
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          /// 🔘 Bottom Skip Button
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const DisclaimerAgreementScreen(),
                        ),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFDC5F00), // Orange
                            Color(0xFFCF0A0A), // Red
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
