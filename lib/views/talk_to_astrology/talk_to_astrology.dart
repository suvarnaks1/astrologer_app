import 'package:flutter/material.dart';

class TalkToAstrologerTabs extends StatelessWidget {
  const TalkToAstrologerTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        /// TAB CONTAINER
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFFDC5F00),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              /// JATHAKAM (ACTIVE)
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC5F00),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Jathakam',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 6),

              /// KAVADI PRESNA (TIME LIMITED)
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Kavadi Presna',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// CONTENT PLACEHOLDER
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 160,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFDC5F00),
              width: 1,
            ),
          ),
          child: const Center(
            child: Text(
              'Jathakam Content UI',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
