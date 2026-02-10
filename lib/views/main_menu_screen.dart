import 'package:astrologer_app/views/bottom_nav.dart';
import 'package:astrologer_app/views/talk_to_astrology/talk_to_astrology.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final pages = const [
   TalkToAstrologerTabs(),
    Center(
      child: Text(
        "Search Page",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Astrology Page",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Notification Page",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
      
        /// 🔥 THIS CHANGES WHEN YOU TAP ICONS
        body: pages[currentIndex],
      
        bottomNavigationBar: CustomBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index; // ✅ THIS MAKES IT WORK
            });
          },
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class AstrologyPage extends StatelessWidget {
  const AstrologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Astrology",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Notifications",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
