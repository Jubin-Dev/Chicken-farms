import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Forgot_passw.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
// import 'package:flutter_app/Screens/dialogs.dart';

class ResetPass extends StatefulWidget{
 static String tag ='Verification';
  @override
  _ForgotPageState  createState()=> new _ForgotPageState(); 
   }
  class _ForgotPageState extends State<ResetPass>   {
  
   bool _obscureText = true;
    @override
    Widget build(BuildContext context) {
    final bloc = Bloc();
    final description = Text("Enter your New Password Here",
                              style: 
                              TextStyle(color:
                              Colors.black ,fontSize: 20.0,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
                              );
   Widget setpassword(){
     return StreamBuilder<String>(
                          stream: bloc.passwordStream,
                          builder:(context, snapshot){
                                return TextField(
                                keyboardType: TextInputType.phone,
                                autofocus: false,
                                obscureText: _obscureText,
                                onChanged: bloc.passwordChanged,
                                // maxLength: 10,
                                decoration: InputDecoration(
                                    labelText: 'Enter New Password',
                                    icon: Icon(Icons.phone_iphone, color: Colors.green,),
                                    suffixIcon: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                 _obscureText = !_obscureText;
                                                });
                                            },
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        semanticLabel: _obscureText ? 'show password' : 'hide password',
                                      ),
                                      ),
                                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                        ),
                                    
                                    );}
                                 );}

          Widget confirmpassword(){
                  return StreamBuilder<String>(
                          stream: bloc.passwordStream,
                          builder:(context, snapshot){
                                return TextField(
                                keyboardType: TextInputType.phone,
                                autofocus: false,
                                obscureText: _obscureText,
                                onChanged: bloc.passwordChanged,
                                // maxLength: 10,
                                decoration: InputDecoration(
                                    labelText: 'Re-Enter New Password',
                                    icon: Icon(Icons.phone_iphone, color: Colors.green,),
                                    suffixIcon: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                 _obscureText = !_obscureText;
                                                });
                                            },
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        semanticLabel: _obscureText ? 'show password' : 'hide password',
                                      ),
                                      ),
                                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                        ),
                                    
                                    );}
                                 );}


        Widget continueButton(){
                      return StreamBuilder<bool>(
                          // stream: bloc.submitcheck,
                          builder:(context,snapshot){
          //  Material(
          //         borderRadius: BorderRadius.circular(40.0),
          //         shadowColor: Colors.lightBlueAccent.shade100,
          //         elevation: 7.0,
                          return RaisedButton(
                            // minWidth: 200.0,
                            // height: 47.0,
                            onPressed: ()=> Navigator.push(
                            context, MaterialPageRoute(builder: (context) => LoginPage())),
                            color: Colors.amber,
                            child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0,)),
                            );}
                        );}
                      
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
                         actions: <Widget>[
                          new IconButton(icon: Icon(Icons.cancel,size: 35.0,),color: Colors.white,
                          onPressed: ()=> Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ForgotPass())),
                              ),
                            ],
                          ),
                      //     leading: IconButton(
                      //         icon: Icon(Icons.arrow_back_ios),
                      //         onPressed: () => Navigator.pop (
                      //         context, MaterialPageRoute(builder: (context) => LoginPage(),
                      //        ),
                      //     ),
                      //  ),
                          
                     
                      // backgroundColor: Colors.white,
                      body: Center(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 25.0,right: 25.0,bottom:100.0 ),
                          children: <Widget>[ 
  
                              SizedBox(height: 10.0),
                              description,
                            
                              SizedBox(height: 20.0),
                              setpassword(),
                              confirmpassword(),
                            
                              SizedBox(height: 20.0,),
                              continueButton(),
                          ],
                        ),
                      ),
                      ),
                      );
                    }
                  }
  
 
  