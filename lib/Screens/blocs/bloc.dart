import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator implements BaseBloc{
  
  // For Login Page

  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  Function(String) get phoneChanged => _phoneController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;  

  Stream<String> get phoneStream => _phoneController.stream.transform(phoneValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitcheck => Observable.combineLatest2(phoneStream, passwordStream, (p, h) => true);

  // submit(){
  //   print("${_phoneController}");
  //   print("${_passwordController}");
  // }

  @override
  void dispose() {
      _phoneController?.close();
    _passwordController?.close();
    
  }
}

abstract class BaseBloc {
  
  void dispose();
}