import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/original/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.background.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "La La Land",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(width: 5),
                      Icon(FontAwesomeIcons.solidStar,
                          color: Theme.of(context).colorScheme.scrim, size: 20),
                      SizedBox(width: 5),
                      Text(
                        "7.2",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Text(
                    "2016 • Drama, Romance",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Here's to the fools who dream.",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
