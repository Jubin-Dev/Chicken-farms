import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator{
  
  // For Login Page

  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // For Registration Page

  final _fullnameContorller = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _repassController = BehaviorSubject<String>();
  

  //Stream data to variable
   
   // Change Data (login page)
  Function(String) get phoneChanged => _phoneController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  
   // Change Data (newUser page)
  Function(String) get nameChanged => _fullnameContorller.sink.add;
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get repassChanged => _repassController.sink.add;  
   
   //Stream data to variable
    //Login Screen
  Stream<String> get phoneStream => _phoneController.stream.transform(phoneValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
    
  //New Registration
  Stream<String> get fullnameStream => _fullnameContorller.stream.transform(fullnameValidator);
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  
  Stream<String> get repassStream => _repassController.stream.transform(repassValidator).doOnData((String r){
   if (0 != _passwordController.value.compareTo(r)){
        // If they do not match, add an error
        _repassController.addError("No Match");
      }
  });
  
  //loginPage
  Stream<bool> get logincheck => Observable.combineLatest2(phoneStream, passwordStream, (p, h) => true);
  //newUserPage
  Stream<bool> get signupcheck => Observable.combineLatest5(phoneStream, passwordStream, fullnameStream, emailStream,repassStream,(p,h,n,e,r)=>(0 == p.compareTo(r)));
  
  
  submit(){
    // print("${_phoneController}");
    // print("${_passwordController}");
  }

  
  dispose() {
      _phoneController.close();
      _passwordController.close();
      _fullnameContorller.close();
      _emailController.close();
      _repassController.close();
  }
}

