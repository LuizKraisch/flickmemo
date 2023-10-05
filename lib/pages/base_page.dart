import 'package:flickmemo/components/bottom_nav_bar.dart';
import 'package:flickmemo/components/side_drawer.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/pages/home_page.dart';
import 'package:flickmemo/pages/profile_page.dart';
import 'package:flickmemo/pages/search_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const BasePage({
    required this.currentFlickmemoUser,
    Key? key,
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  FlickmemoUser? currentFlickmemoUser;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
  }

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(currentFlickmemoUser: currentFlickmemoUser),
      const SearchPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Color(0xff131417),
      drawer: const SideDrawer(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
