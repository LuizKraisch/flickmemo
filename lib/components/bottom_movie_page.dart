import 'package:flickmemo/components/review_modal.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flutter/material.dart';

class BottomMoviePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final Movie? movie;
  final Review? review;

  const BottomMoviePage({
    super.key,
    this.currentFlickmemoUser,
    this.movie,
    this.review,
  });

  @override
  State<BottomMoviePage> createState() => _BottomMoviePageState();
}

class _BottomMoviePageState extends State<BottomMoviePage> {
  FlickmemoUser? currentFlickmemoUser;
  Movie? movie;
  Review? userReview;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    movie = widget.movie;
    userReview = widget.review;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(40),
            padding: EdgeInsets.all(15.0),
            shape: StadiumBorder(),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return ReviewModal(
                  movie: movie,
                  review: userReview,
                  currentFlickmemoUser: currentFlickmemoUser,
                );
              },
            );
          },
          child: Text(
            userReview == null ? "Review" : "Edit Review",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
