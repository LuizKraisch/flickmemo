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
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Review",
                      style: Theme.of(context).textTheme.headlineMedium),
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
                  Icon(FontAwesomeIcons.solidStar,
                      color: Theme.of(context).colorScheme.scrim, size: 20),
                  SizedBox(width: 5),
                  Text(
                    review.score.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
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
          ),
        ]),
      ),
    );
  }
}
