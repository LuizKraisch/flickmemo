import 'dart:async';
import 'package:flickmemo/models/flickmemo_user.dart';

class FlickmemoUserStreamController {
  final StreamController<FlickmemoUser?> _flickmemoUserStreamController =
      StreamController<FlickmemoUser?>.broadcast();

  FlickmemoUserStreamController() {
    _flickmemoUserStreamController.add(null);
  }

  void updateUserInStream(FlickmemoUser? user) {
    _flickmemoUserStreamController.add(user);
  }

  void disposeUserStream() {
    _flickmemoUserStreamController.close();
  }

  Stream<FlickmemoUser?> get flickmemoUserStream =>
      _flickmemoUserStreamController.stream;
}
