import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flickmemo/services/helpers.dart';

void main() {
  group('buildBaseUserParams', () {
    test('returns correct parameters when user is not null', () {
      final user = FlickmemoUser(
        internalID: 'testInternalID',
        firstName: 'testFirstName',
        lastName: 'testLastName',
        photoURL: 'testPhotoURL',
        createdAt: DateTime.now().toString(),
        token: {'token': 'testToken'},
        googleUserUID: 'testGoogleUserId',
      );

      final result = buildBaseUserParams(user);

      expect(result, 'accessToken=testToken&googleUserId=testGoogleUserId');
    });
  });
}
