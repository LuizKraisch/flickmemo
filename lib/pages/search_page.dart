import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131417),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Color(0xff1D1F24),
          floating: true,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
              background: Column(
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
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff383C46),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff585F6F), width: 0.0),
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
                      fontSize: 15.0,
                      color: Color(0xff585F6F),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff582FFE), width: 2.0),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
      ]),
    );
  }
}
