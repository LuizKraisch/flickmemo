import 'package:flickmemo/controllers/user_data.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/pages/licenses_page.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  void signOut() {
    final userData = Provider.of<UserData>(context, listen: false);
    userData.removeUser();
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
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Image.asset(
                    'assets/logos/flickmemo-logo.png',
                    width: 180,
                  ),
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
                  onTap: () {}, // TODO: Add language selector
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
                    leading: FaIcon(FontAwesomeIcons.code,
                        color: Theme.of(context).colorScheme.outline),
                    title: Text(
                      t.common.sideDrawer.options.developer,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onTap: () => launchDeveloperEmail(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
