import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void showAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData.dark(),
            child: CupertinoAlertDialog(
              title: const Text('Logging out?'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                      signOut();
                    });
                  },
                  isDefaultAction: true,
                  isDestructiveAction: true,
                  child: const Text('Yes'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isDefaultAction: false,
                  isDestructiveAction: false,
                  child: const Text('No'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff131417),
      child: Column(
        children: [
          Expanded(
            child: Column(children: [
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Image.asset(
                    'assets/logos/flickmemo-logo.png',
                    width: 180,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading:
                      FaIcon(FontAwesomeIcons.language, color: Colors.white),
                  title: Text(
                    "Change language",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {}, // TODO: Add language selector
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket,
                      color: Colors.white),
                  title: Text(
                    "Sign out",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () => showAlertDialog(context),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ListTile(
                    minLeadingWidth: 10,
                    leading: FaIcon(FontAwesomeIcons.code, color: Colors.white),
                    title: Text(
                      "Talk with the developer",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {}, // TODO: Add malito link
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}