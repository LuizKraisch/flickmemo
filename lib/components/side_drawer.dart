import 'package:flickmemo/helpers/auth_helper.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/pages/licenses_page.dart';
import 'package:flickmemo/pages/login_page.dart';
import 'package:flickmemo/providers/language_provider.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  void signOut() {
    AuthHelper.deleteFlickmemoUser();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void showAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData.dark(),
            child: CupertinoAlertDialog(
              title: Text(t.common.sideDrawer.logOutDialog.title),
              content: Text(t.common.sideDrawer.logOutDialog.content),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                      signOut();
                    });
                  },
                  isDefaultAction: true,
                  isDestructiveAction: true,
                  child: Text(t.common.sideDrawer.logOutDialog.confirm),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isDefaultAction: false,
                  isDestructiveAction: false,
                  child: Text(t.common.sideDrawer.logOutDialog.cancel),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff131417),
      child: Column(
        children: [
          Expanded(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
                child: Image.asset(
                  'assets/logos/flickmemo-logo.png',
                  width: 180,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: FaIcon(FontAwesomeIcons.language,
                      color: Theme.of(context).colorScheme.outline),
                  title: Text(
                    t.common.sideDrawer.options.changeLanguage,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return SelectAppLanguageModal();
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: FaIcon(FontAwesomeIcons.book,
                      color: Theme.of(context).colorScheme.outline),
                  title: Text(
                    t.common.sideDrawer.options.licenses,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LicensesPage(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket,
                      color: Theme.of(context).colorScheme.outline),
                  title: Text(
                    t.common.sideDrawer.options.logOut,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  onTap: () => showAlertDialog(context),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ListTile(
                    minLeadingWidth: 10,
                    leading: FaIcon(FontAwesomeIcons.signal,
                        color: Theme.of(context).colorScheme.outline),
                    title: Text(
                      t.common.sideDrawer.options.status,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onTap: () => launchStatusPage(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ListTile(
                    minLeadingWidth: 10,
                    leading: FaIcon(FontAwesomeIcons.code,
                        color: Theme.of(context).colorScheme.outline),
                    title: Text(
                      t.common.sideDrawer.options.developer,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onTap: () => launchDeveloperEmail(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Flickmemo App • Ver. 1.1.0 "WALL-E"',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectAppLanguageModal extends StatelessWidget {
  const SelectAppLanguageModal({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 350,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    SizedBox(
                      width: 300.0,
                      child: Text(
                        t.common.sideDrawer.languageDialog.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: 300.0,
                      child: Text(
                        t.common.sideDrawer.languageDialog.help,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 60, 60, 60),
                  child: IconButton(
                    icon:
                        const Icon(FontAwesomeIcons.xmark, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                var newLocale = Locale('en');
                languageProvider.updateLocale(newLocale);
                addToast(t.common.sideDrawer.languageDialog.toasts
                    .englishConfirmation);
                Navigator.pop(context);
              },
              child: Text(
                t.common.sideDrawer.languageDialog.options.en,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                var newLocale = Locale('pt');
                languageProvider.updateLocale(newLocale);
                addToast(t.common.sideDrawer.languageDialog.toasts
                    .portugueseConfirmation);
                Navigator.pop(context);
              },
              child: Text(
                t.common.sideDrawer.languageDialog.options.pt,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
