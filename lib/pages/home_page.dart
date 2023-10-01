import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/components/home_page_header.dart';
import 'package:flickmemo/components/movie_card.dart';
import 'package:flickmemo/components/progress_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final currentUser = FirebaseAuth.instance.currentUser;

  void onSwap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          SizedBox(height: 70),
          HomePageHeader(
              currentUser: currentUser,
              onProfileTap: () => Scaffold.of(context).openDrawer()),
          SizedBox(height: 10),
          Column(children: [
            SizedBox(height: 10),
            Text(
              "Hey, ${currentUser?.displayName}!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "Here are some recommendations for you.",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width * 0.95,
            child: AppinioSwiper(
              cardsCount: 10,
              onSwipe: (index, AppinioSwiperDirection direction) {
                onSwap(index);
              },
              swipeOptions:
                  AppinioSwipeOptions.only(left: true, right: true, top: true),
              cardsBuilder: (BuildContext context, int index) {
                return MovieCard();
              },
              onEnd: () {},
            ),
          ),
          ProgressBar(currentIndex: currentIndex),
        ],
      ),
    );
  }
}
