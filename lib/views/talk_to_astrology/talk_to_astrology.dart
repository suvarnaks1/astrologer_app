import 'package:astrologer_app/views/talk_to_astrology/jathakam/jathakam.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color orange = Color(0xFFDC5F00);
  static const Color lightGrey = Color(0xFFEEEEEE);
  static const Color white = Colors.white;
}

class TalkToAstrologerTabs extends StatefulWidget {
  const TalkToAstrologerTabs({super.key});

  @override
  State<TalkToAstrologerTabs> createState() => _TalkToAstrologerTabsState();
}

class _TalkToAstrologerTabsState extends State<TalkToAstrologerTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// 🔘 TAB BAR
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.orange),
              ),
              child: Row(
                children: [
                  _tabButton("Jathakam", 0),
                  const SizedBox(width: 6),
                  _tabButton("Kavadi Presna", 1),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔁 TAB CONTENT (IMPORTANT FIX)
            Expanded(
              child: selectedTab == 0
                  ? const JathakamFormScreen()
                  : const KavadiUI(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    final bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: active ? AppColors.orange : AppColors.black,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active ? Colors.black : Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// ================= KAVADI UI =================

class KavadiUI extends StatelessWidget {
  const KavadiUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.orange),
        ),
        child: const Text(
          "Kavadi Presna\nAvailable only\n8:00–12:00 & 15:00–17:00",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
