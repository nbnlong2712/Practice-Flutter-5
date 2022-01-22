import 'dart:async';

import 'package:flutter_review/src/screen/login_screen.dart';

class Controller {
  StreamController streamController = StreamController();

  Controller(this.streamController);

  String? validationEmail(String? email) {
    String? abc;
    var processor =
        StreamTransformer.fromHandlers(handleData: (String email, sink) {
      if (!email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Invalid email!");
      }
    });

    streamController.stream.map((email) => email).transform(processor).listen(
          (email) {
            abc = email as String?;
          },
          onError: (err) {
            abc = err.toString();
          },
        );

    streamController.sink.add(email);
    return abc;
  }
}
