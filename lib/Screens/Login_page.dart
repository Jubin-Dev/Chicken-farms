import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Forgot_passw.dart';
import 'package:flutter_app/Screens/Home_page.dart';
import 'package:flutter_app/Screens/New_User.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
import 'package:flutter_app/Screens/blocs/provider.dart';

class LoginPage extends StatefulWidget{
  final String tag ='loginPage';
  @override
  _LoginPageState  createState() => new _LoginPageState();   
}
class _LoginPageState extends State<LoginPage> {
  bool _remembermeFlag = false;
  final _UsNumberTextInputFormatter _phoneNumberFormatter = _UsNumberTextInputFormatter();
  bool _obscureText = true;

changeThePage(BuildContext context){
     Navigator.of(context).push
            ( MaterialPageRoute(builder: (context) => MyHomes(),
        ) ); 
      }
    @override
    Widget build(BuildContext context) {
    final bloc = Bloc();
    var sizeHW = MediaQuery.of(context).size;

      Widget logo(){
        return Hero(tag: 'hero', 
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 60.0,
            child: Image.asset('lib/images/rooster.png'),
            ),);
          }
      Widget phone(Bloc bloc) {
        return StreamBuilder<String>(
                  stream: bloc.phoneStream,
                  builder:(context, snapshot){
                      return TextField(
                          // maxLength: 10,
                          onChanged: bloc.phoneChanged,        
                          keyboardType: TextInputType.phone,
                          autofocus: false,
                            decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                // prefixText: '+66',
                                errorText: snapshot.error,
                                icon: Icon(Icons.phone_iphone, color: Colors.green,),
                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0), 
                                ),
                                inputFormatters: <TextInputFormatter> [
                                WhitelistingTextInputFormatter.digitsOnly,
                                _phoneNumberFormatter,
  
                                ],
                            );
                        }
                      );
                    }
        Widget password(Bloc bloc){ 
          return StreamBuilder<String>(
                stream: bloc.passwordStream,
                builder:(context, snapshot){
                  return TextField(
                    onChanged: bloc.passwordChanged,  
                    autofocus: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: snapshot.error,
                        icon: Icon(Icons.lock, color: Colors.green,),
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
                );
          }
      final rememberMe = Container( 
      //  padding: new EdgeInsets.symmetric(horizontal: 0.0),
         child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
          Checkbox( 
            activeColor: Colors.green,
            value: _remembermeFlag,
            onChanged: (value)=> setState((){
            _remembermeFlag = !_remembermeFlag;
            }),
            ),
        new Text("Remember me",style: new TextStyle(color: Colors.deepOrangeAccent,fontSize: 15.0),
        ),
        SizedBox(width: 30.0,),
        new FlatButton(child: Text('Forgot Password ?',style:TextStyle(color:Colors.deepOrangeAccent,fontSize: 15.0)),
        onPressed: ()=> Navigator.push (
        context, MaterialPageRoute(builder: (context) => ForgotPass(),
            ), 
            ),)
           ],),
           );
     
    //  final forgotLabel = Container(alignment:Alignment(1.0, 0.0),
    //    padding: EdgeInsets.only(left: 10.0), 
    //    child:FlatButton(
    //    child: Text('Forgot Password ?',style:TextStyle(color:Colors.deepOrangeAccent,fontSize: 15.0)),
    //    onPressed: ()=> Navigator.push (
    //     context, MaterialPageRoute(builder: (context) => ForgotPass(),
    //     ), 
    //     ),
    //     ), 
    //     );
     
     Widget loginButton(Bloc bloc){
    //  Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10.0),
          return StreamBuilder<bool>(
              stream: bloc.logincheck,
              builder:(context,snapshot){
                return MaterialButton(
                    minWidth: 380.0,
                    color: Colors.amber,
                    child: Text("Login",style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    onPressed: snapshot.hasData ? null : () => changeThePage(context) 
                     );
                   }
                );
             }
      final newUser = FlatButton(
        child: Text('New User?',style:TextStyle(color:Colors.deepOrange,fontSize: 15.0)),
        onPressed: ()=> Navigator.push (
        context, MaterialPageRoute(builder: (context) => NewUser(),
              ) 
            ) 
          );
    // Size screenSize = MediaQuery.of(context).size;
     return Provider(
        child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[450],
          accentColor: Colors.green,
          primarySwatch: Colors.green,
            ),
          home: Scaffold(
              // resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.white,
              body: new SingleChildScrollView(
                    child: new Container(
                      width: ((100/100) * sizeHW.width),
                      // height: ((180/200) * sizeHW.width),
                       padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 32.0),
                          child: new Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                        //  padding: EdgeInsets.only(left: 25.0,right: 25.0),
                            children: <Widget>[
                              
                                    SizedBox(height: 80.0),
                                    logo(),   
                                    SizedBox(height: 30.0),
                                    phone(bloc),
                                    SizedBox(height: 10.0),
                                    password(bloc),
                                    // SizedBox(height: 10.0),
                                    rememberMe,
                                    // forgotLabel,       //flatbutton for forgotpage
                                    SizedBox(height: 10.0,),
                                    loginButton(bloc),
                                    SizedBox(height: 1.0),
                                    newUser,           //flatebutton for newUserPage
                                ],
                              ),
                            ),
                          ),
                        ) 
                      )
                    );
                  }
              }
  
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1)
        selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3)
        selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6)
        selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10)
        selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
  
