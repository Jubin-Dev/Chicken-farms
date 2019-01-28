import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';
class NewUser extends StatefulWidget{
  
  static String tag ='Registration';
  @override
 _NewUserPageState  createState()=> new _NewUserPageState(); 
    
  }
  
  class _NewUserPageState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
   final logo = Hero(tag: 'hero', 
       child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 60.0,
         child: Image.asset('lib/images/rooster.png'),
       ),);
      final email = TextFormField(
        keyboardType: TextInputType.emailAddress ,
        autofocus: false,
        
        decoration: InputDecoration(
          hintText: 'Email ID',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            
          )
        ),
      );
      final name = TextFormField(
        keyboardType: TextInputType.text ,
        autofocus: false,
        // initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Full Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            
          )
        ),
      );
      final phone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Enter Your Mobile No.',
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
   final rePassword = TextFormField(
     autofocus: false,
     initialValue: 'some password',
     obscureText: true,
     decoration: InputDecoration(
         hintText: 'Re-Password',
         contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25.0),
         )
     ),
   );
   
   final loginButton = Padding(
       padding: EdgeInsets.symmetric(vertical: 50.0),
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
          child: Text('Sign-Up',style:TextStyle(color:Colors.black,fontSize: 20.0)),

        ) ,
     ),
   );
    return Scaffold(
     appBar: AppBar(
       title: Text('Registration'),
       centerTitle: true,
       backgroundColor: Color(0xe5c510),
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: () => Navigator.push (
      context, MaterialPageRoute(builder: (context) => LoginPage(),
       ),
     ),
       )
     ),
     backgroundColor: Colors.amberAccent,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 24.0,right: 24.0),
         children: <Widget>[ 
           SizedBox(height: 30.0),
           logo,
           SizedBox(height: 20.0),
           name,
           SizedBox(height: 20.0),
           email,
           SizedBox(height: 20.0),
           phone,
           SizedBox(height: 20.0),
           password,
           SizedBox(height: 20.0),
           rePassword,
           SizedBox(height: 1.0,),
           loginButton,
         
           
         ],
       ),
     ),
   );
  }
  }

    
  
 



