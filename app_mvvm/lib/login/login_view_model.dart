import 'dart:async';

import 'package:app_mvvm/helper/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel{
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();
  
  var emailValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      sink.add(Validation.validateEmail(email));
    } ,
  );

  var passValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      sink.add(Validation.validatePass(pass));
    } ,
  );

  // Stream de UI su dung
  // Sink them du lieu vao stream

  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidation);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream => _passwordSubject.stream.transform(passValidation);
  Sink<String> get passSink => _passwordSubject.sink;

  Stream<bool> get btntStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  //contructor
  LoginViewModel(){
      Rx.combineLatest2(_emailSubject, _passwordSubject, (email, pass){
        Validation.validateEmail(email) == null &&
        Validation.validatePass(pass) == null;
      }).listen((event) {
        btnSink.add(event = true);
      });
  }



  // behavior la stream khi dung phai dong lai
  dispose(){
    _emailSubject.close();
    _passwordSubject.close();
    _btnSubject.close();
  }

}