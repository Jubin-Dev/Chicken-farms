import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
import 'package:flutter_app/Screens/dialogs.dart';
class NewUser extends StatefulWidget{
  
  static String tag ='Registration';
  @override
 _NewUserPageState  createState() => new _NewUserPageState();    
  }
  class _NewUserPageState extends State<NewUser>   {
  @override
  Widget build(BuildContext context) {
      final bloc = Bloc();
        
      Widget logo(){
          return Hero(tag: 'hero', 
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 60.0,
                child: Image.asset('lib/images/rooster.png'),
                  ),
                );
              }
      Widget email(){
        return StreamBuilder<String>(
             stream: bloc.emailStream,
             builder:(context, snapshot){
            return TextField(
                keyboardType: TextInputType.emailAddress ,
                autofocus: false,
                onChanged: bloc.emailChanged,
                decoration: InputDecoration(
                    labelText: 'Email ID',
                    errorText: snapshot.error,
                    icon: Icon(Icons.email, color: Colors.green,),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                    );}
                  );
                }
      Widget name(){
        return StreamBuilder<String>(
              stream: bloc.fullnameStream,
              builder:(context, snapshot){
              return TextField(
                keyboardType: TextInputType.text ,
                autofocus: false,
                onChanged: bloc.nameChanged,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      errorText: snapshot.error,
                      icon: Icon(Icons.account_circle, color: Colors.green,),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                   );}
                );
             }
      Widget phone(){
        return StreamBuilder<String>(
                stream: bloc.phoneStream,
                builder:(context, snapshot){
                  return TextField(
                    keyboardType: TextInputType.phone ,
                    autofocus: false,
                    maxLength: 10,
                    onChanged: bloc.phoneChanged,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Mobile No.',
                        errorText: snapshot.error,
                        icon: Icon(Icons.phone_iphone, color: Colors.green,),
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                          ),
                    );}
                );
             }
      Widget password(){
        return StreamBuilder<String>(
            stream: bloc.passwordStream,
            builder:(context, snapshot){
            return TextField(
              autofocus: false,
              obscureText: true,
              onChanged: bloc.passwordChanged,  
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: snapshot.error,
                  icon: Icon(Icons.lock_open, color: Colors.green,),
                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  ),
               );}
            );
        }
   Widget rePassword(){ 
     return StreamBuilder<String>(
            stream: bloc.repassStream,
            builder:(context, snapshot){
              return TextField(
                  autofocus: false,
                  obscureText: true,
                  onChanged: bloc.repassChanged,
                    decoration: InputDecoration(
                        labelText: 'Confirmed Password',
                        errorText: snapshot.error,
                        icon: Icon(Icons.redo, color: Colors.green,),
                   ),
              );}
          );
      }
   
   Widget loginButton() {
    // Padding(
    //         padding: EdgeInsets.symmetric(vertical: 50.0),
            return StreamBuilder<bool>(
            stream: bloc.signupcheck,
            builder:(context,snapshot){
                return RaisedButton(
                    highlightElevation: 20.0,
                    color: Colors.amber,
                    child: Text('Sign-Up',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    onPressed: snapshot.hasData ? null :()  async {
                    final action = await Dialogs.yesAbortDialog(context,'Verify OTP','OTP:');
                          },
                  );}
               );
            }
       return MaterialApp(
       theme: ThemeData(
          primaryColor: Colors.green[450],
          accentColor: Colors.green,
          primarySwatch: Colors.green,
         ),
        home:new Scaffold(
            resizeToAvoidBottomPadding: false,
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
              logo(),
              SizedBox(height: 20.0),
              name(),
              SizedBox(height: 20.0),
              email(),
              SizedBox(height: 20.0),
              phone(),
              SizedBox(height: 10.0),
              password(),
              SizedBox(height: 20.0),
              rePassword(),
              SizedBox(height: 30.0,),
              loginButton(),
                ],
              ),
            ),
            ),
         );
      }
      }
    
  
 



