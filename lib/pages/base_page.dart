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
  late PageController _pageController;
  int _selectedIndex = 0;
  FlickmemoUser? currentFlickmemoUser;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void navigateBottomBar(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(currentFlickmemoUser: currentFlickmemoUser),
      SearchPage(currentFlickmemoUser: currentFlickmemoUser),
      ProfilePage(currentFlickmemoUser: currentFlickmemoUser),
    ];

    return Scaffold(
      backgroundColor: Color(0xff131417),
      drawer: const SideDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
