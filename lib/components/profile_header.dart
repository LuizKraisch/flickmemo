import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.currentUser,
  });

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(currentUser?.photoURL as String),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentUser?.displayName as String,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "User since August, 2023",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "243",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "Films",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("12", style: Theme.of(context).textTheme.displaySmall),
                  Text(
                    "Reviews",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "213",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "Watchlist",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
