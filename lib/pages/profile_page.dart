import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/components/profile_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          floating: true,
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
              background: Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: ProfileHeader(currentUser: currentUser),
          )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 400,
                    color: Theme.of(context).colorScheme.secondary),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 400,
                    color: Theme.of(context).colorScheme.secondary),
              )),
        ),
      ]),
    );
  }
}
