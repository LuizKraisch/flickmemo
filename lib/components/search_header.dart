import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/pages/search_results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeader extends StatelessWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const SearchHeader({
    super.key,
    this.currentFlickmemoUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        Text(t.searchPage.header.title,
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 15),
        SizedBox(
          width: 325.0,
          height: 45.0,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchResultsPage(
                    currentFlickmemoUser: currentFlickmemoUser),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 3.0, 15.0, 3.0),
              decoration: BoxDecoration(
                color: Color(0xff2B2D33),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Color.fromARGB(130, 255, 255, 255),
                      size: 15,
                    ),
                  ),
                  Text(
                    t.searchPage.header.searchBarPlaceholder,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(130, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
