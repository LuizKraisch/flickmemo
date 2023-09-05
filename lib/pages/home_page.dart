import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void showAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
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
    return Scaffold(
      backgroundColor: Color(0xff131417),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Image.asset(
          'assets/logos/flickmemo-short-logo.png',
          height: 30,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 35, 0),
            child: GestureDetector(
                onTap: () => showAlertDialog(context),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(currentUser?.photoURL as String),
                )),
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 10),
          Text(
            "Hey! ${currentUser?.displayName}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          Text(
            "Here are some recommendations for you.",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ]),
      ),
    );
  }
}
