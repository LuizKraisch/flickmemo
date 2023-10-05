import 'dart:async';
import 'package:flickmemo/models/flickmemo_user.dart';

class FlickmemoUserStreamController {
  static final _singleton = FlickmemoUserStreamController._internal();

  factory FlickmemoUserStreamController() {
    return _singleton;
  }

  FlickmemoUserStreamController._internal();

  final StreamController<FlickmemoUser?> _userController =
      StreamController<FlickmemoUser?>.broadcast();

  Stream<FlickmemoUser?> get userStream => _userController.stream;

  void addUser(FlickmemoUser? user) {
    _userController.sink.add(user);
  }

  void dispose() {
    _userController.close();
  }
}
