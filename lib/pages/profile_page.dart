import 'package:flickmemo/components/favorite_movies.dart';
import 'package:flickmemo/components/profile_header.dart';
import 'package:flickmemo/components/recent_movies.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const ProfilePage({
    this.currentFlickmemoUser,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FlickmemoUser? currentFlickmemoUser;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            floating: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child:
                    ProfileHeader(currentFlickmemoUser: currentFlickmemoUser),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FavoriteMovies(currentFlickmemoUser: currentFlickmemoUser),
                  SizedBox(height: 10),
                  RecentMovies(currentFlickmemoUser: currentFlickmemoUser),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
