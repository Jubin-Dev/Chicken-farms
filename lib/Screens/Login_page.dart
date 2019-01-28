import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/New_User.dart';
import 'package:flutter_app/Screens/forgot_passw.dart';


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
         backgroundColor: Colors.yellow,
         radius: 60.0,
         child: Image.asset('lib/images/rooster.png'),
       ),);
      final phone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Mobile Number',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            
          )
        ),
      );
   final password = TextFormField(
     autofocus: false,
     initialValue: 'some password',
     obscureText: true,
     decoration: InputDecoration(
         hintText: 'Password',
         contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25.0),
         )
     ),
   );
   
   final forgotLabel = Container(alignment:Alignment(1.0, 0.0),
     padding: EdgeInsets.only(top:10.0,left: 20.0), 
     child:FlatButton(
     child: Text('Forgot password?',style:TextStyle(color:Colors.green,fontSize: 15.0)),
     onPressed: ()=> Navigator.push (
      context, MaterialPageRoute(builder: (context) => Forgot_Pass(),
      ), 
     ) ,
    ), 
    );
   
   final loginButton = Padding(
       padding: EdgeInsets.symmetric(vertical: 80.0),
     child: Material(
       borderRadius: BorderRadius.circular(30.0),
       shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 6.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 47.0,
          onPressed: (){

           },
          color: Colors.yellow,
          child: Text('Login',style:TextStyle(color:Colors.black,fontSize: 20.0)),

        ) ,
     ),
   );
   
    final newUser = FlatButton(
     child: Text('New User?',style:TextStyle(color:Colors.green,fontSize: 15.0)),
     onPressed: ()=> Navigator.push (
      context, MaterialPageRoute(builder: (context) => NewUser(),
      ) 
     ) 
     );

   return Scaffold(
     backgroundColor: Colors.amberAccent,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 24.0,right: 24.0),
         children: <Widget>[
           logo,
           SizedBox(height: 50.0),
           phone,
           SizedBox(height: 15.0),
           password,
           forgotLabel,
           SizedBox(height: 10.5,),
           loginButton,
           SizedBox(height: 5.0),
           newUser,
           

         ],
       ),
     ),
   );
     }
}
  
