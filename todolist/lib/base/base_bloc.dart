import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'base_event.dart';
abstract class BaseBloc{
  StreamController<BaseEvent> _eventControllerStream = StreamController<BaseEvent>();

  // streamcontroller dung sink de day event vao sink
  Sink<BaseEvent> get event => _eventControllerStream.sink;

   BaseBloc(){
    _eventControllerStream.stream.listen((event) {
          if(event is! BaseEvent){
            throw Exception("Event Khong hop le");
          }

          dispatchEvent(event);
    });
  }
  void dispatchEvent(BaseEvent event);

   @mustCallSuper
   void dispose(){
     _eventControllerStream.close();
   }
}
