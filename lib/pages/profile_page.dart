import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/components/movie_poster.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FavoriteMovies(),
                  SizedBox(height: 10),
                  GridMovies(),
                ],
              )),
        )
      ]),
    );
  }
}

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favorite Movies",
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: Scrollbar(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: MoviePoster(),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GridMovies extends StatelessWidget {
  const GridMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.7;
    final double itemWidth = size.width / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Grid Movies", style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(
          height: (itemHeight * 4.4),
          child: GridView.count(
            padding: EdgeInsets.only(top: 15),
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 3,
            children: List.generate(21, (index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: MoviePoster(),
              );
            }),
          ),
        ),
      ],
    );
  }
}
