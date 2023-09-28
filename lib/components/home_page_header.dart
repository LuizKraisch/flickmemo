import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
    required this.currentUser,
    required this.onProfileTap,
  });

  final User? currentUser;
  final void Function() onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logos/flickmemo-short-logo.png',
            width: 45,
          ),
          GestureDetector(
              onTap: onProfileTap,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(currentUser?.photoURL as String),
                backgroundColor: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
