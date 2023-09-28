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
        Text(
          "Search by the movie's title",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 10),
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
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff383C46),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color(0xff585F6F), width: 0.0),
          borderRadius: BorderRadius.circular(100.0),
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Color(0xff585F6F),
          size: 15,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
        ),
        hintText: 'Try for names like La La Land, WALL-E...',
        hintStyle: TextStyle(
          fontSize: 13.0,
          color: Color(0xff585F6F),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color(0xff582FFE), width: 2.0),
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
