import 'package:flickmemo/components/login_button.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/services/auth_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool loading = false;

  void _setLoading(bool loadingValue) {
    setState(() {
      loading = loadingValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'assets/images/app-presentation.png',
                  fit: BoxFit.fill,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: MainContainer(
                  setLoading: _setLoading,
                ),
              ),
            ],
          ),
          Visibility(
            visible: loading,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  final Function(bool) setLoading;

  const MainContainer({required this.setLoading, super.key});

  @override
  Widget build(BuildContext context) {
    void logIn() async {
      setLoading(true);
      try {
        var flickmemoUser = await AuthService(context).signIn();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BasePage(
              currentFlickmemoUser: flickmemoUser,
            ),
          ),
        );
      } finally {
        setLoading(false);
      }
    }

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
                t.loginPage.title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                t.loginPage.subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: LoginButton(
                    onPressed: () => logIn(),
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
