import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const ProfileHeader({
    super.key,
    required this.currentFlickmemoUser,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  UserService userService = UserService();
  FlickmemoUser? currentFlickmemoUser;
  FlickmemoUser? user;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;

    userService.getUserInfo(currentFlickmemoUser).then((result) {
      setState(() {
        user = result;
      });
    }).catchError((error) {
      throw Exception('Failed to find user info.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user!.photoURL),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user!.firstName} ${user!.lastName}",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(width: 5),
                        Text(
                          t.profilePage.header.profileCreation(
                              date: formatProfileCreationDate(user!.createdAt)),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          user!.watchedCount.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          t.profilePage.header.counts.watched,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(user!.favoritesCount.toString(),
                            style: Theme.of(context).textTheme.displaySmall),
                        Text(
                          t.profilePage.header.counts.favorites,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          user!.watchlistCount.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          t.profilePage.header.counts.watchlist,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
