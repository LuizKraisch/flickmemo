import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  FlickmemoUser? _user;

  FlickmemoUser? get user => _user;

  void setUser(FlickmemoUser? user) {
    _user = user;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }
}
