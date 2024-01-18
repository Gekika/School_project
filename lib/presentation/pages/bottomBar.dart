import 'package:flutter/material.dart';
import 'package:invest/presentation/pages/pocket_page.dart';
import 'package:invest/presentation/pages/settings_page.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'History_page.dart';
import 'home_page.dart';

class UserNav extends StatefulWidget {
  const UserNav({super.key});

  @override
  State<UserNav> createState() => _UserNavState();
}

class _UserNavState extends State<UserNav> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const HistoryPage(),
    const PocketPage(),
    const SettingsPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: SizedBox(
          height: 65,
          child: SalomonBottomBar(
            duration: const Duration(milliseconds: 500),
            onTap: onTap,
            currentIndex: currentIndex,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home, color: Colors.white,),
                title: const Text("Home"),
                selectedColor: Colors.yellow,
              ),

              /// Short Videos
              SalomonBottomBarItem(
                icon: const Icon(Icons.cast_for_education, color: Colors.white,),
                title: const Text("Learn"),
                selectedColor: Colors.yellow,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.calculate_sharp, color: Colors.white,),
                title: const Text("Invest"),
                selectedColor: Colors.yellow,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.logout, color: Colors.white,),
                title: const Text("Settings"),
                selectedColor: Colors.yellow,
              ),
            ],
            //  curve: Curves.easeOutQuint,
          ),
        ));
  }
}
