import 'package:flutter/material.dart';
import 'package:astrologer_app/views/util/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMuted = false;
  bool isVideoOff = false;
  bool isFrontCamera = true;
  String callTime = "00:00";

  @override
  void initState() {
    super.initState();

    // Simulated timer start
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        callTime = "00:01";
      });
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  void _toggleVideo() {
    setState(() {
      isVideoOff = !isVideoOff;
    });
  }

  void _switchCamera() {
    setState(() {
      isFrontCamera = !isFrontCamera;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [

          /// 🔹 Full Screen Video Placeholder
          Container(
            color: AppColors.darkGrey,
            child: const Center(
              child: Icon(
                Icons.videocam,
                size: 80,
                color: AppColors.lightGrey,
              ),
            ),
          ),

          /// 🔹 Small Self Video Preview
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              height: 120,
              width: 90,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.orange),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: AppColors.white,
                ),
              ),
            ),
          ),

          /// 🔹 Top Info
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Astrologer Sharma",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  callTime,
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 Bottom Controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                /// Mute
                _buildCircleButton(
                  icon: isMuted ? Icons.mic_off : Icons.mic,
                  color: isMuted ? AppColors.red : AppColors.darkGrey,
                  onTap: _toggleMute,
                ),

                /// Video Toggle
                _buildCircleButton(
                  icon:
                      isVideoOff ? Icons.videocam_off : Icons.videocam,
                  color: isVideoOff
                      ? AppColors.red
                      : AppColors.darkGrey,
                  onTap: _toggleVideo,
                ),

                /// Switch Camera
                _buildCircleButton(
                  icon: Icons.cameraswitch,
                  color: AppColors.darkGrey,
                  onTap: _switchCamera,
                ),

                /// End Call
                _buildCircleButton(
                  icon: Icons.call_end,
                  color: AppColors.red,
                  size: 65,
                  iconSize: 28,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    double size = 55,
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
