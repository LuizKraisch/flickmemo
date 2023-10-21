import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewModal extends StatefulWidget {
  const ReviewModal({super.key});

  @override
  State<ReviewModal> createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 545,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                      Text(
                        'Nowhere',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(0xff2B2D33),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: DropdownButton<String>(
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Icon(
                          FontAwesomeIcons.chevronDown,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      elevation: 4,
                      underline: Container(),
                      items: <String>[
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
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                      value: '1',
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 30.0,
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
                  )
                ],
              ),
              Text(
                "Note",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
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
                  child: TextField(
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
                    scale: 2.0,
                    child: Checkbox(
                      splashRadius: 16.0,
                      activeColor: Colors.white,
                      value: true,
                      checkColor: Colors.grey.shade900,
                      onChanged: (bool? newValue) {
                        // Handle checkbox state changes here
                      },
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {},
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
    );
  }
}
