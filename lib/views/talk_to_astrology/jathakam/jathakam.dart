import 'package:astrologer_app/views/talk_to_astrology/jathakam/payment_screen.dart';
import 'package:astrologer_app/views/talk_to_astrology/jathakam/session_type.dart';
import 'package:astrologer_app/views/util/colors.dart';
import 'package:flutter/material.dart';

/// ================= JATHAKAM FORM =================

class JathakamFormScreen extends StatelessWidget {
  const JathakamFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.orange),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title("Jathakam Details"),

            const SizedBox(height: 20),

            _inputField("Name"),
            const SizedBox(height: 16),

            _inputField("Date of Birth", hint: "DD / MM / YYYY"),
            const SizedBox(height: 16),

            _inputField("Time of Birth", hint: "HH : MM AM/PM"),
            const SizedBox(height: 16),

            _inputField("Place of Birth"),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                    Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) =>  SessionTypeSelector(),
    ),
  );
                },
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _inputField(String label, {String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 6),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: AppColors.lightGrey.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
