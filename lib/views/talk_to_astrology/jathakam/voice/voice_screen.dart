import 'package:flutter/material.dart';
import 'package:astrologer_app/views/util/colors.dart';

class VoiceCallScreen extends StatefulWidget {
  const VoiceCallScreen({super.key});

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  bool isMuted = false;
  bool isSpeakerOn = false;
  String callStatus = "Calling...";
  String callTime = "00:00";

  @override
  void initState() {
    super.initState();

    // Simulate connection after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        callStatus = "Connected";
        callTime = "00:01";
      });
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  void _toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// 🔹 Top Section
            Column(
              children: [

                const SizedBox(height: 40),

                const CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.orange,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Astrologer Sharma",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  callStatus,
                  style: const TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  callTime,
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            /// 🔹 Bottom Controls
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  /// Mute Button
                  _buildCircleButton(
                    icon: isMuted ? Icons.mic_off : Icons.mic,
                    color: isMuted ? AppColors.red : AppColors.darkGrey,
                    onTap: _toggleMute,
                  ),

                  /// End Call Button
                  _buildCircleButton(
                    icon: Icons.call_end,
                    color: AppColors.red,
                    size: 70,
                    iconSize: 30,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  /// Speaker Button
                  _buildCircleButton(
                    icon: isSpeakerOn
                        ? Icons.volume_up
                        : Icons.volume_off,
                    color: isSpeakerOn
                        ? AppColors.orange
                        : AppColors.darkGrey,
                    onTap: _toggleSpeaker,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    double size = 60,
    double iconSize = 24,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: AppColors.white,
        ),
      ),
    );
  }
}
