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
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Theme.of(context).colorScheme.onBackground,
          size: 15,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
        ),
        hintText: 'Try for names like La La Land, WALL-E...',
        hintStyle: TextStyle(
          fontSize: 13.0,
          color: Theme.of(context).colorScheme.onBackground,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface, width: 2.0),
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}
