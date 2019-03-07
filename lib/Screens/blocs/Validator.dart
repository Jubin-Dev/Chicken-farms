import 'dart:async';

class Validator{

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
  var fullnameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (fullname,sink){
      if(fullname.length>10){
        sink.add(fullname);
        }else{
          sink.addError("Enter a Valid Name");
        }
    }
  );
   var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains('@')){
        sink.add(email);
        }else{
          sink.addError("Enter a Valid Email Adress");
        }
    }
   );
    var repassValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (repass,sink){
      if(repass.length > 5){
        sink.add(repass);
        }else{
          sink.addError("Entered Password not matched");
        }
    }
   );
      //Farm Profile
   var notEmptyValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (farmname,sink){
      if(farmname.isNotEmpty){
        sink.add(farmname);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
   var farmAdressValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (farmAdress,sink){
      if(farmAdress.length > 4){
        sink.add(farmAdress);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
    var mobileValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (mobile,sink){
      if(mobile.length > 4){
        sink.add(mobile);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
   var alternatemobileValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (altmobile,sink){
      if(altmobile.length > 4){
        sink.add(altmobile);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
    var lineIdValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (lineId,sink){
      if(lineId.length > 4){
        sink.add(lineId);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
   var anyWebValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (anyWeb,sink){
      if(anyWeb.length > 4){
        sink.add(anyWeb);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
    var socialValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (social,sink){
      if(social.length > 4){
        sink.add(social);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
   var aboutUsValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (aboutUs,sink){
      if(aboutUs.length > 4){
        sink.add(aboutUs);
        }else{
          sink.addError("Field is mandatory");
        }
    }
   );
    final validatedropDown = StreamTransformer<String,String>.fromHandlers(
  handleData: (dpvalue, sink) {
   
    if (dpvalue.isNotEmpty) 
        {
          sink.add(dpvalue);
        }
        else
        {
          sink.addError('Select Data !');
        
        }
  });
  final validatecalender = StreamTransformer<String,String>.fromHandlers(
  handleData: (calendervalue, sink) {
   
    if (calendervalue.isNotEmpty) 
        {
          sink.add(calendervalue);
        }
        else
        {
          sink.addError('Select Date !');
        
        }
  });


}