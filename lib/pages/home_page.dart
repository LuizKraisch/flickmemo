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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(currentUser?.photoURL as String),
          ),
          SizedBox(height: 10),
          Text(
            "Hey! ${currentUser?.displayName}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Logged in as: ${currentUser?.email}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          TextButton(
              onPressed: () => showAlertDialog(context), child: Text('Log Out'))
        ]),
      ),
    );
  }
}
