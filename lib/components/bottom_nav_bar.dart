import 'package:flickmemo/i18n/strings.g.dart';
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
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: GNav(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.fromLTRB(15, 10, 10, 8),
            gap: 100,
            onTabChange: (value) => onTabChange!(value),
            iconSize: 20,
            textStyle: TextStyle(
                fontSize: 15.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            tabs: [
              GButton(
                icon: FontAwesomeIcons.film,
                text: t.common.bottomNavBar.home,
              ),
              GButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                text: t.common.bottomNavBar.search,
              ),
              GButton(
                icon: FontAwesomeIcons.solidUser,
                text: t.common.bottomNavBar.profile,
              ),
            ]),
      ),
    );
  }
}
