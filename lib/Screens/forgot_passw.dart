import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';

class Forgot_Pass extends StatefulWidget{
 static String tag ='Verification';
  @override
  _ForgotPageState  createState()=> new _ForgotPageState(); 
      
   }
  
  class _ForgotPageState extends State<Forgot_Pass> {
  @override
  Widget build(BuildContext context) {
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
          child: Text('Continue',style:TextStyle(color:Colors.black,fontSize: 20.0)),

        ) ,
     ),
   );
    return Scaffold(
     appBar: AppBar(
       title: Text('Recover Password'),
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
           
           SizedBox(height: 20.0),
           phone,
           
          SizedBox(height: 1.0,),
           loginButton,
         
           
         ],
       ),
     ),
   );
  }
}
