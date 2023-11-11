import 'package:flickmemo/models/external_review.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ExternalReviewBox extends StatelessWidget {
  final ExternalReview review;

  const ExternalReviewBox({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(review
                                    .authorDetails["avatar_path"] !=
                                null
                            ? 'https://www.themoviedb.org/t/p/original/${review.authorDetails["avatar_path"]}'
                            : 'https://i.stack.imgur.com/l60Hf.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180.0,
                            child: Text(
                              review.authorDetails["name"] != ""
                                  ? review.authorDetails["name"]
                                  : 'TMDB User',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
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
                    ],
                  ),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Theme.of(context).colorScheme.scrim,
                          size: 15,
                        ),
                        SizedBox(width: 6),
                        Text(
                          review.authorDetails["rating"] != null
                              ? review.authorDetails["rating"].toString()
                              : 'N/A',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300.00,
                height: 50.00,
                child: Text(
                  formatExternalReviewContent(review
                      .content), // TODO: Add separate place to show full review.
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            ]),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
