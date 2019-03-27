import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/AlertDialogs/alertOTPdialog.dart';
import 'package:flutter_app/Screens/Login_page.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';
// import 'package:flutter_app/Screens/dialogs.dart';

class NewUser extends StatefulWidget{
  
  static String tag ='Registration';
 
  @override
 _NewUserPageState  createState() => new _NewUserPageState();
}
class _NewUserPageState extends State<NewUser>   {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 PersonData person = PersonData();
 final _UsNumberTextInputFormatter _phoneNumberFormatter = _UsNumberTextInputFormatter();
 final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  bool _autovalidate = true;
  bool _formWasEdited = false;
  bool _obscureText = true;
 
 void _handleSubmitted() {
     final FormState form = _formKey.currentState;
     if (!form.validate()) {
       _autovalidate = true; // Start validating on every change.
       showInSnackBar('Please fix the errors in red before submitting.');
           } else {
             form.save();
             showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
           }
         }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validatePhoneNumber(String value) {
    _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Please enter a password.';
    if (passwordField.value != value)
      return 'The passwords don\'t match';
    return null;
  }
  
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
                   return TextFormField(
                       keyboardType: TextInputType.emailAddress ,
                       autofocus: false,
                       onSaved: (String value) { person.email = value; },
                      //  onChanged: bloc.emailChanged,
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
                     return TextFormField(
                       keyboardType: TextInputType.text ,
                       autofocus: false,
                       textCapitalization: TextCapitalization.words,
                      //  onChanged: bloc.nameChanged,
                         decoration: InputDecoration(
                             labelText: 'Full Name',
                             errorText: snapshot.error,
                             icon: Icon(Icons.account_circle, color: Colors.green,),
                             contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                             ),
                            onSaved: (String value) { person.name = value; },
                            validator: _validateName,
                          );}
                       );
                    }
             Widget phone(){
               return StreamBuilder<String>(
                       stream: bloc.phoneStream,
                       builder:(context, snapshot){
                         return TextFormField(
                           keyboardType: TextInputType.phone ,
                           autofocus: false,
                          //  77xLength: 13,
                           validator: _validatePhoneNumber,
                          //  onChanged: bloc.phoneChanged,
                             decoration: InputDecoration(
                               labelText: 'Enter Your Mobile No.',
                              //  prefixText: '+66',
                               errorText: snapshot.error,
                               icon: Icon(Icons.phone_iphone, color: Colors.green,),
                               contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                 ),
                                 inputFormatters: <TextInputFormatter> [
                             WhitelistingTextInputFormatter.digitsOnly,
                             _phoneNumberFormatter,
         
                                       ],
                           );}
                       );
                    }
             Widget password(){
               return StreamBuilder<String>(
                   stream: bloc.passwordStream,
                   builder:(context, snapshot){
                   return TextFormField(
                     autofocus: false,
                     obscureText: _obscureText,
                    //  onChanged: bloc.passwordChanged,  
                       decoration: InputDecoration(
                         labelText: 'Password',
                         errorText: snapshot.error,
                         icon: Icon(Icons.lock_open, color: Colors.green,),
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
          Widget rePassword(){ 
            return StreamBuilder<String>(
                   stream: bloc.repassStream,
                   builder:(context, snapshot){
                     return TextFormField(
                         autofocus: false,
                         obscureText: true,
                         validator: _validatePassword,
                        //  onChanged: bloc.repassChanged,
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
                       return MaterialButton(
                         minWidth: 380.0,
                           highlightElevation: 20.0,
                           color: Colors.amber,
                           child: Text('Sign-Up',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                          //  onPressed: snapshot.hasData ? null :() 
                          onPressed: snapshot.hasData ? null:() async {
                           final action = await OTPDialogs.yesAbortDialog(context,'Verify OTP','OTP:');
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
       
             home: new Scaffold(
                   //  resizeToAvoidBottomPadding: false,
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
            body: new SingleChildScrollView(
                           child: new Container( 
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 16.0, vertical: 32.0),
                           child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 mainAxisSize: MainAxisSize.max,
                                       children: <Widget>[ 
                                         SizedBox(height: 10.0),
                                         logo(),
                                         SizedBox(height: 10.0),
                                         name(),
                                         SizedBox(height: 10.0),
                                         email(),
                                         SizedBox(height: 10.0),
                                         phone(),
                                         // SizedBox(height: .0),
                                         password(),
                                         SizedBox(height: 10.0),
                                         rePassword(),
                                         SizedBox(height: 30.0,),
                                         loginButton(),
                                           ],
                                         ),
                                         ),
                                       ),
                                   ));
                                 }
       
void showInSnackBar(String value) {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _scaffoldKey.currentState.showSnackBar(SnackBar(
  content: Text(value),
     ));
     }    
   }
 
 class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
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
  

    
  
 



