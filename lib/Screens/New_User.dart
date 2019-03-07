import 'package:flutter/material.dart';
import 'package:flutter_app/Resourcefile/txtCss.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
import 'package:flutter_app/Screens/dialogs.dart';
class NewUser extends StatefulWidget{
  
  static String tag ='Registration';
  @override
 _NewUserPageState  createState() => new _NewUserPageState();    
  }
  class _NewUserPageState extends State<NewUser> with TxtCss  {
  @override
  Widget build(BuildContext context) {
        final bloc = Bloc();
        final logo = Hero(tag: 'hero', 
       child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 60.0,
         child: Image.asset('lib/images/rooster.png'),
       ),);
      final email = StreamBuilder<String>(
             stream: bloc.emailStream,
             builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.emailAddress ,
          autofocus: false,
          onChanged: bloc.emailChanged,
          decoration: InputDecoration(
          hintText: 'Email ID',
          suffixIcon: Icon(Icons.email, color: Colors.green,),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0), 
          // )
        ),
      ));
      final name = StreamBuilder<String>(
              stream: bloc.fullnameStream,
              builder:(context, snapshot)=>
        TextField(
        keyboardType: TextInputType.text ,
        autofocus: false,
        onChanged: bloc.nameChanged,
        decoration: InputDecoration(
          hintText: 'Full Name',
          suffixIcon: Icon(Icons.account_circle, color: Colors.green,),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0),
            
          // )
        ),
       ),
       );
      final phone = StreamBuilder<String>(
            stream: bloc.phoneStream,
            builder:(context, snapshot)=>
        TextField(
          keyboardType: TextInputType.phone ,
          autofocus: false,
          maxLength: 10,
          onChanged: bloc.phoneChanged,
          decoration: InputDecoration(
          hintText: 'Enter Your Mobile No.',
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green,),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                ),
            ),
            );
   final password = StreamBuilder<String>(
            stream: bloc.passwordStream,
            builder:(context, snapshot)=>
            TextField(
            autofocus: false,
            obscureText: true,
            onChanged: bloc.passwordChanged,  
            decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: Icon(Icons.lock_open, color: Colors.green,),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //  border: OutlineInputBorder(
        //    borderRadius: BorderRadius.circular(25.0),
        //  )
       ),
       ),
        );
   final rePassword = StreamBuilder<String>(
            stream: bloc.passwordStream,
            builder:(context, snapshot)=>
            TextField(
            autofocus: false,
            obscureText: true,
            onChanged: bloc.repassChanged,
            decoration: InputDecoration(
            hintText: 'Confirmed Password',
            suffixIcon: Icon(Icons.redo, color: Colors.green,),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //  border: OutlineInputBorder(
        //    borderRadius: BorderRadius.circular(25.0),
        //  )
     ),
    )
     );
   
   final loginButton = Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: StreamBuilder<bool>(
            stream: bloc.signupcheck,
            builder:(context,snapshot)=> 
            RaisedButton(
              // minWidth: 200.0,
              // height: 47.0,
              highlightElevation: 20.0,
              color: Colors.amber,
              onPressed: snapshot.hasData ? null :()  async {
              final action = await Dialogs.yesAbortDialog(context,'Verify OTP','OTP:');
               },
              child: Text('Sign-Up',style:TextStyle(color:Colors.white,fontSize: 20.0)),
               ) ,
               ),
              ); 
       return MaterialApp(
       theme: ThemeData(
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
     ),
        home: Scaffold(
        appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
        backgroundColor: Colors.amber,
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop (
          context, MaterialPageRoute(builder: (context) => LoginPage(),
       ),
     ),
       )
     ),
     backgroundColor: Colors.white,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 25.0,right: 25.0),
         children: <Widget>[ 
           SizedBox(height: 20.0),
           logo,
           SizedBox(height: 20.0),
           name,
           SizedBox(height: 20.0),
           email,
           SizedBox(height: 20.0),
           phone,
           SizedBox(height: 10.0),
           password,
           SizedBox(height: 20.0),
           rePassword,
           SizedBox(height: 1.0,),
           loginButton,
         
           
         ],
       ),
     ),
    
     ),
    
   );
  }
  }
    
  
 



