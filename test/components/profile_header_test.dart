import 'package:flickmemo/components/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/skeleton.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('ProfileHeader Widget Tests', () {
    testWidgets('Renders user data when future completes successfully',
        (WidgetTester tester) async {
      final flickmemoUser = FlickmemoUser(
        internalID: '123',
        firstName: 'John',
        lastName: 'Doe',
        photoURL: 'https://example.com/avatar.jpg',
        createdAt: DateTime.now().toString(),
        watchedCount: '10',
        favoritesCount: '5',
        watchlistCount: '7',
      );

      final userService = MockUserService();
      when(userService.getUserInfo(any)).thenAnswer((_) async => flickmemoUser);

      await tester.pumpWidget(
        MaterialApp(
          home: ProfileHeader(
            currentFlickmemoUser: flickmemoUser,
          ),
        ),
      );

      await tester.pump();

      expect(find.text('${flickmemoUser.firstName} ${flickmemoUser.lastName}'),
          findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(ErrorInfo), findsNothing);
      expect(find.byType(Skeleton), findsNothing);
    });

    testWidgets('Renders error message when future completes with an error',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProfileHeader(
            currentFlickmemoUser: null,
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ErrorInfo), findsOneWidget);
      expect(find.text('Failed to find user info.'), findsOneWidget);
      expect(find.byType(Skeleton), findsNothing);
    });

    testWidgets('Renders loading skeleton when future is still loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProfileHeader(
            currentFlickmemoUser: null,
          ),
        ),
      );

      expect(find.byType(Skeleton), findsWidgets);
      expect(find.byType(ErrorInfo), findsNothing);
    });
  });
}

class MockUserService extends Mock implements UserService {}
