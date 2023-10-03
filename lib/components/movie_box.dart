import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/original/rVRtRE6HJ5xbdo5jd9aTT8tEVaF.jpg'),
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
                colors: const [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "La La Land",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "2016 • Drama, Romance",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.solidStar,
                          color: Theme.of(context).colorScheme.scrim, size: 20),
                      SizedBox(width: 5),
                      Text(
                        "7.2",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
