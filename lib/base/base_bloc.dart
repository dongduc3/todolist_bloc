import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todolist_bloc/base/base_event.dart';

abstract class BaseBloc {
  final StreamController<BaseEvent> _eventController =
      StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventController.sink;

  BaseBloc() {
    _eventController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Kh phai event");
      }
      baseEvent(event);
    });
  }
  void baseEvent(BaseEvent event) {}

  @mustCallSuper
  void dispose() {
    _eventController.close();
  }
}
