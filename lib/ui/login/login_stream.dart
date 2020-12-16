import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginStream {
  final BehaviorSubject phoneControl = BehaviorSubject<String>();
  final BehaviorSubject passwordControl = BehaviorSubject<String>();
  final PublishSubject loadingData = PublishSubject<bool>();
  final PublishSubject errorOccur = PublishSubject<String>();

  final validatePhone = StreamTransformer<String, String>.fromHandlers(
      handleData: (String phone, EventSink<String> sink) {
    if (phone.length > 8)
      sink.add(phone);
    else
      sink.addError("Entrer un numéro de téléphone valide !");
  });

  final validatePwd = StreamTransformer<String, String>.fromHandlers(
      handleData: (String pwd, EventSink<String> sink) {
    if (pwd.length > 4)
      sink.add(pwd);
    else
      sink.addError("Mot de passe non conforme !");
  });

  Function(String) get updatePhone => phoneControl.sink.add;
  Function(String) get updatePassword => passwordControl.sink.add;

  Stream<String> get getPhone => phoneControl.stream.transform(validatePhone);
  Stream<String> get getPassword =>
      passwordControl.stream.transform(validatePwd);
  Stream<bool> get loading => loadingData.stream;
  Stream<String> get error => errorOccur.stream;

  Stream<bool> get submitValid =>
      Rx.combineLatest2(getPhone, getPassword, (getPhone, getPassword) => true);

  void submit() {
    final submitPhone = phoneControl.value;
    final submitPassword = passwordControl.value;
    errorOccur.sink.add(null);
    loadingData.sink.add(true);
    login(submitPhone, submitPassword);
  }

  login(String phone, String password) {
    // loadingData.sink.add(false);
    // errorOccur.sink.add("Une erreur c'est produite");
  }

  void dispose() {
    phoneControl.close();
    passwordControl.close();
    loadingData.close();
    errorOccur.close();
  }
}
