import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
 static String tag ='loginPage';
  @override
  _LoginPageState  createState()=> new _LoginPageState(); 
   
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
   final logo = Hero(tag: 'hero', 
       child: CircleAvatar(
         backgroundColor: Colors.white54,
         radius: 60.0,
         child: Image.asset('lib/images/rooster.png'),
       ),);
      final phone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91',
        decoration: InputDecoration(
          hintText: 'Mobile Number',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          )
        ),
      );
   final password = TextFormField(
     autofocus: false,
     initialValue: 'some password',
     obscureText: true,
     decoration: InputDecoration(
         hintText: 'Password',
         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30.0),
         )
     ),
   );
   final loginButton = Padding(
       padding: EdgeInsets.symmetric(vertical: 160.0),
     child: Material(

     ),
   );

   return new Container();
  }
}
  
