import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
    required this.profilePhotoURL,
    required this.onProfileTap,
  });

  final String profilePhotoURL;
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
                backgroundImage: NetworkImage(profilePhotoURL),
                backgroundColor: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
