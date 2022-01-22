import 'package:flutter/material.dart';
import 'package:flutter_review/src/app.dart';

/*void main()
{
  runApp(App());
}*/

import 'dart:async';
import 'package:flutter/material.dart';

class Cake {}

class Order {
  String? name;

  Order(this.name);
}

void main() {
  final controller = StreamController();

  var baker = StreamTransformer.fromHandlers(handleData: (bakeType, sink) {
    if (bakeType == "BanhMi") {
      sink.add(bakeType);
    } else {
      sink.addError("We can't do it! Sorry kid");
    }
  });
  controller.stream.map((order) => order.name).transform(baker).listen(
        (cake) {
      print("haha $cake");
    },
    onError: (err) => print(err),
  );

  var order = Order("Burger");
  controller.sink.add(order);
  var order1 = Order("BanhMi");
  controller.sink.add(order1);

}

