import 'package:astrologer_app/views/util/colors.dart';
import 'package:flutter/material.dart';

class MyProfileWalletScreen extends StatelessWidget {
  const MyProfileWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🔹 Profile Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  /// 🔸 Profile Image with Icons
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [

                      /// Profile Avatar
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.orange,
                        child: Icon(
                          Icons.person,
                          size: 45,
                          color: AppColors.black,
                        ),
                      ),

                      /// Camera Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.red,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt,
                                size: 18, color: AppColors.white),
                            onPressed: () {
                              _showImageOptions(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "John Doe",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "+91 9876543210",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Wallet Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.red, AppColors.orange],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Wallet Balance",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "₹ 2,500",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Add Money Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Add Money",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Transactions Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Transactions",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            _transactionTile(
              "Chat Session",
              "- ₹500",
              "12 Feb 2026",
              false,
            ),
            _transactionTile(
              "Wallet Recharge",
              "+ ₹1000",
              "10 Feb 2026",
              true,
            ),
            _transactionTile(
              "Voice Call",
              "- ₹1000",
              "08 Feb 2026",
              false,
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Bottom Sheet for Camera / Gallery
  static void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Choose Profile Picture",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  /// Camera Option
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt,
                            color: AppColors.orange, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                          // Add Camera logic here
                        },
                      ),
                      const Text(
                        "Camera",
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),

                  /// Gallery Option
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo_library,
                            color: AppColors.orange, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                          // Add Gallery logic here
                        },
                      ),
                      const Text(
                        "Gallery",
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  static Widget _transactionTile(
      String title, String amount, String date, bool isCredit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isCredit ? Icons.arrow_downward : Icons.arrow_upward,
            color: isCredit ? Colors.green : AppColors.red,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isCredit ? Colors.green : AppColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
