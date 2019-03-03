import 'dart:async';

mixin Validator{

  var phoneValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (phone,sink){
      if(phone.length >=10){
        sink.add(phone);
      }else{
        sink.addError("Mobile Number is not Valid");
      }
    }
  );
  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length > 5){
        sink.add(password);
      }else{
        sink.addError("Password is not Valid");
      }
    }
  );
}