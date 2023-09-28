import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1D1F24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: GNav(
            backgroundColor: Color(0xff1D1F24),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff582FFE),
            padding: EdgeInsets.fromLTRB(15, 10, 10, 8),
            gap: 100,
            onTabChange: (value) => onTabChange!(value),
            iconSize: 20,
            textStyle: TextStyle(
                fontSize: 15.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            tabs: const [
              GButton(icon: FontAwesomeIcons.film, text: 'Home'),
              GButton(icon: FontAwesomeIcons.magnifyingGlass, text: 'Search'),
              GButton(icon: FontAwesomeIcons.solidUser, text: 'Profile'),
            ]),
      ),
    );
  }
}
