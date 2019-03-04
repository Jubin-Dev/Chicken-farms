import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Forgot_passw.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';
import 'package:flutter_app/Screens/New_User.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';


class LoginPage extends StatefulWidget{
  final String tag ='loginPage';
  @override
  _LoginPageState  createState() => new _LoginPageState();   
}
class _LoginPageState extends State<LoginPage> {
 
 changeThePage(BuildContext context){
   Navigator.of(context).push
          ( MaterialPageRoute(builder: (context) => MyNav(),
    ) ); 
}
  @override
  Widget build(BuildContext context) {

  final bloc = Bloc();
     
  final logo = Hero(tag: 'hero', 
       child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 60.0,
         child: Image.asset('lib/images/rooster.png'),
       ),);

      final phone = StreamBuilder<String>(
             stream: bloc.phoneStream,
            builder:(context, snapshot)=>
        TextField(
        maxLength: 10,
        onChanged: bloc.phoneChanged,        
        keyboardType: TextInputType.phone ,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Mobile Number',
          errorText: snapshot.error,
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green,),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0), 
        ),
        ),
        );
   final password =  StreamBuilder<String>(
            stream: bloc.passwordStream,
            builder:(context, snapshot)=>TextField(
     onChanged: bloc.passwordChanged,  
     autofocus: false,
    //  initialValue: 'some password',
     obscureText: true,
     decoration: InputDecoration(
         hintText: 'Password',
      errorText: snapshot.error,
         suffixIcon: Icon(Icons.lock, color: Colors.green,),
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        
     ),
    ), );
   
   final forgotLabel = Container(alignment:Alignment(1.0, 0.0),
     padding: EdgeInsets.only(top:10.0,left: 20.0), 
     child:FlatButton(
     child: Text('Forgot password?',style:TextStyle(color:Colors.deepOrangeAccent,fontSize: 15.0)),
     onPressed: ()=> Navigator.push (
      context, MaterialPageRoute(builder: (context) => ForgotPass(),
      ), 
      ),
      ), 
      );
   
   final loginButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0),
     child:StreamBuilder<bool>(
            stream: bloc.submitcheck,
            builder:(context,snapshot)=>
          RaisedButton(
           highlightElevation: 20.0,
           color: Colors.amber,
          // minWidth: 200.0,
          // height: 47.0,
          onPressed: snapshot.hasData ? () => changeThePage(context) : null,
      //     => Navigator.push (
      //     context, MaterialPageRoute(builder: (context) => MyNav(),
      // ) 
          child: Text("Login",style:TextStyle(color:Colors.white,fontSize: 20.0)),

          ),  ) ,
     );

    final newUser = FlatButton(
     child: Text('New User?',style:TextStyle(color:Colors.deepOrange,fontSize: 15.0)),
     onPressed: ()=> Navigator.push (
      context, MaterialPageRoute(builder: (context) => NewUser(),
      ) 
     ) 
     );

   return MaterialApp(
     theme: ThemeData(
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
     ),
      home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 25.0,right: 25.0),
        //  key: formKey,
        //  autovalidate: _autoValidate,
         children: <Widget>[
            logo,   
           SizedBox(height: 50.0),
            phone,
           SizedBox(height: 15.0),
            password,
           forgotLabel,       //flatbutton for forgotpage
           SizedBox(height: 10.5,),
            loginButton,
           SizedBox(height: 5.0),
            newUser,           //flatebutton for newUserPage
         ],
       ),
      ),
      ),
     );
     }
}
  
