import 'package:flickmemo/models/review.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                children: [
                  Text("Your Review",
                      style: Theme.of(context).textTheme.titleSmall),
                  Text("July 18, 2023",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.solidStar,
                      color: Theme.of(context).colorScheme.scrim, size: 20),
                  SizedBox(width: 5),
                  Text(
                    "7.0",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
