import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/dialogs.dart';

class Forgot_Pass extends StatefulWidget{
 static String tag ='Verification';
  @override
  _ForgotPageState  createState()=> new _ForgotPageState(); 
      
   }
  
  class _ForgotPageState extends State<Forgot_Pass> {
  @override
  Widget build(BuildContext context) {
final description =   Text("To use SMS verification, you need access to the verified, phone number and click to Continue.",
                      style: TextStyle(color:
                        Colors.black ,fontSize: 20.0,fontWeight: FontWeight.w400),
                        );
  final phone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Enter Your Mobile No.',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0),
            
          // )
        ),
      );
      final continueButton = Padding(
       padding: EdgeInsets.symmetric(vertical: 50.0),
     child: Material(
       borderRadius: BorderRadius.circular(30.0),
       shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 6.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 47.0,
          onPressed: () async {
            final action = await Dialogs.yesAbortDialog(context,'Verify OTP','OTP:');
           },
          color: Colors.yellow,
          child: Text('Continue',style:TextStyle(color:Colors.black,fontSize: 20.0)),

        ) ,
     ),
   );
    return MaterialApp(
    home: new Scaffold(
     appBar: AppBar(
       title: Text('Recover Password'),
       centerTitle: true,
       backgroundColor: Colors.amberAccent,
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: () => Navigator.push (
      context, MaterialPageRoute(builder: (context) => LoginPage(),
       ),
     ),
       )
     ),
     backgroundColor: Colors.white,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 24.0,right: 24.0),
         children: <Widget>[ 
           SizedBox(height: 20.0),
           description,
           
           SizedBox(height: 20.0),
           phone,
           
          SizedBox(height: 1.0,),
           continueButton ,
         
           
         ],
       ),
     ),
     ) 
     );
  }
}
