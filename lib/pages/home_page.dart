import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
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

  void onFinish() {
    print('Reached the end!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131417),
      body: Column(
        children: [
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logos/flickmemo-short-logo.png',
                  width: 45,
                ),
                GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(currentUser?.photoURL as String),
                      backgroundColor: Colors.transparent,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(children: [
            SizedBox(height: 10),
            Text(
              "Hey, ${currentUser?.displayName}!",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Text(
              "Here are some recommendations for you.",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
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
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff1D1F24),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Text(
                    index.toString(),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                );
              },
              onEnd: () => onFinish(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 22, 60, 0),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                end: currentIndex.toDouble(),
              ),
              builder: (context, value, _) => LinearProgressIndicator(
                minHeight: 8,
                value: value / 10,
                backgroundColor: Color(0xff383C46),
                borderRadius: BorderRadius.circular(10),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
