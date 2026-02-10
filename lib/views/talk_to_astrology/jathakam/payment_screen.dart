import 'package:flutter/material.dart';

class PaymentUI extends StatelessWidget {
  final String sessionType;
  final String sessionDescription;
  final String duration;
  final int basePrice;
  
  const PaymentUI({
    super.key,
    required this.sessionType,
    required this.sessionDescription,
    required this.duration,
    required this.basePrice,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate GST and total
    final double gstAmount = basePrice * 0.18;
    final double totalAmount = basePrice + gstAmount;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _summaryCard(),
            const SizedBox(height: 24),
            _priceBreakdown(basePrice.toDouble() , gstAmount, totalAmount),
            const SizedBox(height: 32),
            _payButton(totalAmount),
            const SizedBox(height: 20),
            _secureNote(),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDC5F00)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Session Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 14),
          _RowItem("Consultation Type", sessionType),
          _RowItem("Description", sessionDescription),
          _RowItem("Duration", duration),
        ],
      ),
    );
  }

  Widget _priceBreakdown(double basePrice, double gstAmount, double totalAmount) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          _RowItem("Base Price", "₹${basePrice.toStringAsFixed(0)}"),
          const SizedBox(height: 10),
          _RowItem("GST (18%)", "₹${gstAmount.toStringAsFixed(0)}"),
          const Divider(color: Colors.white24),
          _RowItem(
            "Total Amount",
            "₹${totalAmount.toStringAsFixed(0)}",
            isBold: true,
            highlight: true,
          ),
        ],
      ),
    );
  }

  Widget _payButton(double totalAmount) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDC5F00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 6,
        ),
        onPressed: () {
          // Razorpay trigger later
          // You can use totalAmount here for payment
          print('Payment amount: $totalAmount');
          print('Session type: $sessionType');
        },
        child: Text(
          "Pay ₹${totalAmount.toStringAsFixed(0)} Securely",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget _secureNote() {
    return const Text(
      "100% Secure Payments via Razorpay",
      style: TextStyle(
        color: Colors.white38,
        fontSize: 12,
        decoration: TextDecoration.none,
      ),
    );
  }
}

/// 🔹 Reusable row
class _RowItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final bool highlight;

  const _RowItem(
    this.label,
    this.value, {
    this.isBold = false,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: highlight
                  ? const Color(0xFFDC5F00)
                  : Colors.white,
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}