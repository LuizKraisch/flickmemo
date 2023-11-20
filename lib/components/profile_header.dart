import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/skeleton.dart';
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
  FlickmemoUser? currentFlickmemoUser;
  Future<FlickmemoUser>? flickmemoUserFuture;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    flickmemoUserFuture = fetchUserInfo();
  }

  Future<FlickmemoUser> fetchUserInfo() async {
    try {
      UserService userService = UserService();
      final result = await userService.getUserInfo(currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find user info.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FlickmemoUser>(
      future: fetchUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data;
          return Container(
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
                          "${user.firstName} ${user.lastName}",
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
                          user.watchedCount.toString(),
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
                        Text(user.favoritesCount.toString(),
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
                          user.watchlistCount.toString(),
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
          );
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorInfo(errorMessage: snapshot.error.toString()),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: const [
                Row(
                  children: [
                    Skeleton(width: 70, height: 70, radius: 100),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(width: 200, height: 20, radius: 20),
                        SizedBox(height: 10),
                        Skeleton(width: 100, height: 20, radius: 20),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Skeleton(width: 50, height: 50, radius: 100),
                    SizedBox(width: 10),
                    Skeleton(width: 50, height: 50, radius: 100),
                    SizedBox(width: 10),
                    Skeleton(width: 50, height: 50, radius: 100),
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }
}
