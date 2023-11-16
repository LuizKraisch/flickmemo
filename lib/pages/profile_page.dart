import 'package:flickmemo/components/favorite_movies.dart';
import 'package:flickmemo/components/profile_header.dart';
import 'package:flickmemo/components/recent_movies.dart';
import 'package:flickmemo/components/watchlist_movies.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ProfileHeader(currentFlickmemoUser: currentFlickmemoUser),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            FavoriteMovies(currentFlickmemoUser: currentFlickmemoUser),
            SizedBox(height: 5),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                    labelColor: Theme.of(context).colorScheme.background,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 0.0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.all(5.0),
                    tabs: const [
                      Tab(text: 'Recentes'),
                      Tab(text: 'Watchlist'),
                    ],
                  ),
                  SizedBox(
                    height: 450,
                    child: TabBarView(
                      children: [
                        RecentMovies(
                          currentFlickmemoUser: currentFlickmemoUser,
                        ),
                        WatchlistMovies(
                          currentFlickmemoUser: currentFlickmemoUser,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
