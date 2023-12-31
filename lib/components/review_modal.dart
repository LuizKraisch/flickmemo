import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flickmemo/services/review_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReviewModal extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final Movie? movie;
  final Review? review;

  const ReviewModal({
    super.key,
    this.currentFlickmemoUser,
    this.movie,
    this.review,
  });

  @override
  State<ReviewModal> createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  FlickmemoUser? currentFlickmemoUser;
  Movie? movie;
  Review? userReview;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ReviewService reviewService = ReviewService();

  bool isReviewLoading = false;
  bool isReviewButtonLoading = false;

  String? formScore;
  String? formNote;
  bool? formNoteHasSpoilers;
  bool? userFavorite;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    movie = widget.movie;
    userReview = widget.review;

    formScore = '0';
    formNote = widget.review?.note ?? "";
    formNoteHasSpoilers = false;
    userFavorite = false;

    if (widget.review != null) {
      setState(() {
        isReviewLoading = true;
      });
      reviewService
          .getReview(
              user: currentFlickmemoUser, reviewId: widget.review?.uuid ?? '')
          .then((result) {
        setState(() {
          formScore = result.score;
          formNote = result.note;
          formNoteHasSpoilers = result.noteHasSpoilers;
          userFavorite = result.favorite;
        });
        setState(() {
          isReviewLoading = false;
        });
      }).catchError((error) {
        setState(() {
          isReviewLoading = false;
        });
        addToast(t.toast.error);
        throw Exception('Failed to find review info.');
      });
    }
  }

  List<String> options = List.generate(11, (index) => '$index');

  void submitReview() async {
    setState(() {
      isReviewButtonLoading = true;
    });

    widget.review != null ? updateReview() : createReview();
  }

  void createReview() async {
    try {
      await reviewService.createReview(
        context: context,
        user: currentFlickmemoUser,
        reviewData: {
          "uuid": userReview?.uuid ?? '',
          "score": formScore,
          "note": formNote,
          "noteHasSpoilers": formNoteHasSpoilers,
          "favorite": userFavorite,
        },
        movieId: movie!.id,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (error) {
      setState(() {
        isReviewButtonLoading = false;
      });
      addToast(t.toast.error);
      throw Exception('Failed to create review.');
    }
  }

  void updateReview() async {
    try {
      await reviewService.updateReview(
        context: context,
        user: currentFlickmemoUser,
        reviewData: {
          "uuid": userReview?.uuid ?? '',
          "score": formScore,
          "note": formNote,
          "noteHasSpoilers": formNoteHasSpoilers,
          "favorite": userFavorite,
        },
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (error) {
      setState(() {
        isReviewButtonLoading = false;
      });
      addToast(t.toast.error);
      throw Exception('Failed to update review.');
    }
  }

  void removeReview() {
    reviewService.deleteReview(
      user: currentFlickmemoUser,
      reviewId: widget.review?.uuid ?? '',
    );
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 50,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: 550,
          child: !isReviewLoading
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Color.fromARGB(255, 60, 60, 60),
                              ),
                              width: 80.0,
                              height: 6.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    t.moviePage.reviewModal.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 300.0,
                                    child: Text(
                                      movie?.title ??
                                          t.moviePage.reviewModal
                                              .movieTitlePlaceholder,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromARGB(255, 60, 60, 60),
                                child: IconButton(
                                  icon: const Icon(FontAwesomeIcons.xmark,
                                      color: Colors.white),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            t.moviePage.reviewModal.fields.score,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 8.0),
                                width: 150.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: DropdownButtonFormField<String>(
                                  decoration:
                                      InputDecoration.collapsed(hintText: ''),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  icon: Icon(
                                    FontAwesomeIcons.chevronDown,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  elevation: 4,
                                  value: formScore,
                                  onChanged: (value) {
                                    setState(() {
                                      formScore = value;
                                    });
                                  },
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  dropdownColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  items: options.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          value,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(width: 15.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: userFavorite == false
                                            ? Color.fromARGB(139, 60, 60, 60)
                                            : Color.fromARGB(255, 171, 49, 49),
                                        child: IconButton(
                                          icon: const Icon(
                                              FontAwesomeIcons.solidHeart,
                                              size: 20,
                                              color: Colors.white),
                                          onPressed: () => {
                                            setState(() {
                                              userFavorite = !userFavorite!;
                                            }),
                                          },
                                        ),
                                      ),
                                      Text(
                                        t.moviePage.reviewModal.buttons
                                            .favorite,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  userReview != null
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15.0,
                                          ),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Color.fromARGB(
                                                    139, 60, 60, 60),
                                                child: IconButton(
                                                  icon: const Icon(
                                                      FontAwesomeIcons.trash,
                                                      size: 20,
                                                      color: Colors.white),
                                                  onPressed: () {
                                                    showModalBottomSheet<void>(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ConfirmReviewRemovalModal(
                                                          removeReview:
                                                              removeReview,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                t.moviePage.reviewModal.buttons
                                                    .remove,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                t.moviePage.reviewModal.fields.note,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  t.moviePage.reviewModal.fields.noteHint,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: 400.0,
                            height: 150.0,
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextFormField(
                                scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    formNote = value;
                                  });
                                },
                                initialValue: formNote,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: t.moviePage.reviewModal.fields
                                      .notePlaceholder,
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromARGB(130, 255, 255, 255),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.0),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.8,
                                child: Checkbox(
                                  splashRadius: 16.0,
                                  activeColor: Colors.white,
                                  value: formNoteHasSpoilers,
                                  onChanged: (value) => {
                                    setState(() {
                                      formNoteHasSpoilers = value;
                                    })
                                  },
                                  checkColor: Colors.grey.shade900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                t.moviePage.reviewModal.fields.noteWithSpoilers,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(40),
                                padding: EdgeInsets.all(15.0),
                                shape: StadiumBorder(),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () => submitReview(),
                              child: isReviewButtonLoading
                                  ? LoadingAnimationWidget.fourRotatingDots(
                                      color: Colors.white,
                                      size: 24.0,
                                    )
                                  : Text(
                                      t.moviePage.reviewModal.buttons.save,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 50.0,
                  ),
                ),
        ),
      ),
    );
  }
}

class ConfirmReviewRemovalModal extends StatelessWidget {
  final void Function() removeReview;

  const ConfirmReviewRemovalModal({super.key, required this.removeReview});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 5.0),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Color.fromARGB(255, 60, 60, 60),
                ),
                width: 80.0,
                height: 6.0,
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 300.0,
                      child: Text(
                        t.moviePage.reviewModal.deleteReview.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Text(
                        t.moviePage.reviewModal.deleteReview.subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 60, 60, 60),
                  child: IconButton(
                    icon:
                        const Icon(FontAwesomeIcons.xmark, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                t.moviePage.reviewModal.deleteReview.cancelButton,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 60, 60, 60),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                removeReview();
              },
              child: Text(
                t.moviePage.reviewModal.deleteReview.confirmButton,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
