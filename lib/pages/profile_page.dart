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
      backgroundColor: Color(0xff131417),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Color(0xff1D1F24),
          floating: true,
          expandedHeight: 200,
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
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
      ]),
    );
  }
}
