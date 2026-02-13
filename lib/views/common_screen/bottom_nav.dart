import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF000000), // black
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: const Color(0xFFDC5F00), // orange border
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return _buildNavItem(index);
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    IconData icon;

    switch (index) {
      case 0:
        icon = Icons.auto_awesome; // Talk to Astrologer
        break;
      case 1:
        icon = Icons.account_balance_wallet; // Profile & Wallet
        break;
      default:
        icon = Icons.feedback; // Feedback / Complaint
    }

    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(12),
        decoration: isActive
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDC5F00), // orange active bg
              )
            : null,
        child: Icon(
          icon,
          size: 26,
          color: isActive
              ? const Color(0xFF000000) // black icon on orange
              : const Color(0xFFEEEEEE), // light grey
        ),
      ),
    );
  }
}
