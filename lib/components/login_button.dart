import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPressed;
  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey,
          minimumSize: Size.fromHeight(40),
          padding: EdgeInsets.all(15.0),
          shape: StadiumBorder(),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        icon: Image.asset('assets/logos/google-g-logo.png', height: 25),
        label: Text(
          "Continue with Google",
          style: GoogleFonts.poppins(
            color: Color(0xff2D2323),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ));
  }
}