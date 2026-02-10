
import 'package:astrologer_app/views/bottom_nav.dart';
import 'package:astrologer_app/views/main_menu_screen.dart';
import 'package:astrologer_app/views/util/colors.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
      
                /// Icon
                CircleAvatar(
                  radius: 38,
                  backgroundColor: AppColors.red,
                  child: const Icon(
                    Icons.language,
                    color: AppColors.white,
                    size: 36,
                  ),
                ),
      
                const SizedBox(height: 24),
      
                /// Title
                const Text(
                  "Choose Your Language",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orange,
                  ),
                ),
      
                const SizedBox(height: 8),
      
                /// Subtitle
                const Text(
                  "You can change this later in settings",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.lightGrey,
                  ),
                ),
      
                const SizedBox(height: 32),
      
                /// Language List
                const LanguageTile(title: "English", subtitle: "English"),
                const LanguageTile(title: "മലയാളം", subtitle: "Malayalam"),
                const LanguageTile(title: "தமிழ்", subtitle: "Tamil"),
                const LanguageTile(title: "हिंदी", subtitle: "Hindi"),
      
                const Spacer(),
      
                /// Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MainScreen()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// Language Tile Widget
class LanguageTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const LanguageTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.translate,
            color: AppColors.red,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
