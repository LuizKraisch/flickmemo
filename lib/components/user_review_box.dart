import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserReviewBox extends StatelessWidget {
  final Review review;

  const UserReviewBox({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff1D1F24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.moviePage.body.userReview.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    formatExternalReviewDate(review.createdAt),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  review.favorite
                      ? Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                t.moviePage.body.favorite,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  SizedBox(width: 5.0),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.solidStar,
                            color: Theme.of(context).colorScheme.scrim,
                            size: 15),
                        SizedBox(width: 6),
                        Text(
                          review.score != '0' ? review.score : '--',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          review.note != ''
              ? Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 200.0,
                        maxWidth: 290.0,
                        minHeight: 30.0,
                        maxHeight: 50.0,
                      ),
                      child: Text(
                        review.note,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      t.moviePage.body.userReview.empty,
                      style: GoogleFonts.poppins(
                        color: Color(0xff646464),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
