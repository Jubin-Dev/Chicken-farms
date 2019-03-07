import 'package:flutter/material.dart';
import 'package:flutter_app/Resourcefile/txtCss.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
import 'package:flutter_app/Screens/dialogs.dart';

class ForgotPass extends StatefulWidget{
 static String tag ='Verification';
  @override
  _ForgotPageState  createState()=> new _ForgotPageState(); 
      
   }
  
  class _ForgotPageState extends State<ForgotPass> with TxtCss  {
  @override
  Widget build(BuildContext context) {

     final bloc = Bloc();

  final description =   Text("To use SMS verification, you need access to the verified, phone number and click to Continue.",
                            style: 
                            TextStyle(color:
                            Colors.black ,fontSize: 20.0,fontWeight: FontWeight.w400,),
                         );
  
  
    final phone =  StreamBuilder<String>(
                    stream: bloc.phoneStream,
                    builder:(context, snapshot)=>
                    TextField(
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    onChanged: bloc.phoneChanged,
                    maxLength: 10,
                    decoration: InputDecoration(
                    hintText: 'Enter Your Mobile No.',
                    suffixIcon: Icon(Icons.phone_iphone, color: Colors.green,),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0),
            
          // )
        ),
     ),
      );
        final continueButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child:  StreamBuilder<bool>(
                stream: bloc.submitcheck,
                builder:(context,snapshot)=>
        //  Material(
        //         borderRadius: BorderRadius.circular(40.0),
        //         shadowColor: Colors.lightBlueAccent.shade100,
        //         elevation: 7.0,
         RaisedButton(
          // minWidth: 200.0,
          // height: 47.0,
          onPressed: snapshot.hasData ? null: () async {
            final action = await Dialogs.yesAbortDialog(context,'Verify OTP','OTP:');
           },
          color: Colors.amber,
          child: Text('Continue',style:TextStyle(color:Colors.white,fontSize: 25.0,)),

        ) ,
     ),
  );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
        ),
      home: new Scaffold(
      appBar: AppBar(
       title: Text('Recover Password'),
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

            SizedBox(height: 10.0),
            description,
           
            SizedBox(height: 20.0),
             phone,
           
            SizedBox(height: 20.0,),
            continueButton ,
         
           
         ],
       ),
     ),
     ),
     );
  }
}
