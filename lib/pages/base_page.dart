import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/components/bottom_nav_bar.dart';
import 'package:flickmemo/components/side_drawer.dart';
import 'package:flickmemo/pages/home_page.dart';
import 'package:flickmemo/pages/profile_page.dart';
import 'package:flickmemo/pages/search_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  final currentUser = FirebaseAuth.instance.currentUser;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131417),
      drawer: const SideDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
