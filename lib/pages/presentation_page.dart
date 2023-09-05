import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flickmemo/services/auth_service.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131417),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child:
                Image.asset('assets/images/app-presentation.png', height: 500),
          ),
          MainContainer(),
        ],
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Image.asset('assets/logos/flickmemo-logo-small.png',
                    height: 30),
              ),
              Text(
                "Review films you've watched. Save those you want to see.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Text(
                "Welcome to Flickmemo. Let's start your lists!",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: LoginButton(
                    onPressed: () => AuthService().signIn(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
