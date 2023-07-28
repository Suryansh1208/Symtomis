import 'package:devpirates/features2.dart';
import 'package:flutter/material.dart';

import 'features.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptomis'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(70, 12, 104, -100),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          Features(),
          Features2(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_rounded,
              ),
              label: 'Disease Desc'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.medication_liquid_rounded,
              ),
              label: 'Symptom Checker'),
        ],
        currentIndex: _selectedIndex,
        onTap: navigationTapped,
      ),
    );
  }
}
