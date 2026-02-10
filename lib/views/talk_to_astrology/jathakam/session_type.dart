import 'package:astrologer_app/views/talk_to_astrology/jathakam/payment_screen.dart';
import 'package:flutter/material.dart';

class SessionTypeSelector extends StatefulWidget {
  const SessionTypeSelector({super.key});

  @override
  State<SessionTypeSelector> createState() => _SessionTypeSelectorState();
}

class _SessionTypeSelectorState extends State<SessionTypeSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔽 CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    const Text(
                      "Select Your Session",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Choose how you wish to consult",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _sessionCard(
                      index: 0,
                      title: "Chat Consultation",
                      price: "₹250 / ₹500",
                      duration: "15 min / 30 min",
                      icon: Icons.chat_outlined,
                    ),

                    _sessionCard(
                      index: 1,
                      title: "Voice Consultation",
                      price: "₹1000",
                      duration: "30 minutes",
                      icon: Icons.call_outlined,
                    ),

                    _sessionCard(
                      index: 2,
                      title: "Video Consultation",
                      price: "₹2000",
                      duration: "60 minutes",
                      icon: Icons.videocam_outlined,
                    ),

                    const SizedBox(height: 12),

                    const Center(
                      child: Text(
                        "+ 18% GST will be added",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            /// 🔘 SUBMIT BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC5F00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PaymentUI(),
                      ),
                    );
                  },
                  child: const Text(
                    "Proceed to Payment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sessionCard({
    required int index,
    required String title,
    required String price,
    required String duration,
    required IconData icon,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? const Color(0xFFDC5F00) : Colors.white12,
            width: 1.4,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFDC5F00).withOpacity(0.35),
                    blurRadius: 18,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFDC5F00)
                    : Colors.white10,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.black : Colors.white70,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              price,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFFDC5F00)
                    : Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
