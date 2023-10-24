import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/review.dart';

class ReviewModal extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final Movie? movie;
  final Review? review;

  const ReviewModal({
    super.key,
    this.currentFlickmemoUser,
    this.movie,
    this.review,
  });

  @override
  State<ReviewModal> createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  FlickmemoUser? currentFlickmemoUser;
  Movie? movie;
  Review? userReview;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? formScore = '0';
  String? formNote = "";
  bool? formNoteHasSpoilers = false;

  List<String> options = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    movie = widget.movie;
    userReview = widget.review;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 50,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: 550,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 5.0),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Color.fromARGB(255, 60, 60, 60),
                        ),
                        width: 80.0,
                        height: 6.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Adding review for...',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 300.0,
                              child: Text(
                                movie?.title ?? 'Movie Title',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromARGB(255, 60, 60, 60),
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.xmark,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Score",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Container(
                          width: 150.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xff2B2D33),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(hintText: ''),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            icon: Icon(
                              FontAwesomeIcons.chevronDown,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            elevation: 4,
                            hint: Text('Your score'),
                            onChanged: (value) {
                              setState(() {
                                formScore = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an score';
                              }
                              return null;
                            },
                            items: options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        SizedBox(
                          width: 185.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(139, 60, 60, 60),
                                    child: IconButton(
                                      icon: const Icon(
                                          FontAwesomeIcons.solidHeart,
                                          size: 20,
                                          color: Colors.white),
                                      onPressed: () => {},
                                    ),
                                  ),
                                  Text(
                                    'Favorite',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15.0),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(139, 60, 60, 60),
                                    child: IconButton(
                                      icon: const Icon(FontAwesomeIcons.trash,
                                          size: 20, color: Colors.white),
                                      onPressed: () => {},
                                    ),
                                  ),
                                  Text(
                                    'Remove',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Note",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Optional",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    SizedBox(
                      width: 400.0,
                      height: 150.0,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff2B2D33),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          onChanged: (value) {
                            setState(() {
                              formNote = value;
                            });
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a note...',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
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
                      ),
                    ),
                    SizedBox(height: 14.0),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.8,
                          child: Checkbox(
                            splashRadius: 16.0,
                            activeColor: Colors.white,
                            value: userReview?.noteHasSpoilers ??
                                formNoteHasSpoilers,
                            onChanged: (value) => {
                              setState(() {
                                formNoteHasSpoilers = value;
                              })
                            },
                            checkColor: Colors.grey.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Note with spoilers',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          padding: EdgeInsets.all(15.0),
                          shape: StadiumBorder(),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "Save",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
