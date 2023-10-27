import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        Text("Search by the movie's title",
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 15),
        SizedBox(
          width: 325.0,
          height: 45.0,
          child: SearchInput(),
        ),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 3.0, 15.0, 3.0),
      decoration: BoxDecoration(
        color: Color(0xff2B2D33),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Color.fromARGB(130, 255, 255, 255),
            size: 15,
          ),
          border: InputBorder.none,
          hintText: 'La La Land, WALL-E, Spider-Man...',
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
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
    );
  }
}
