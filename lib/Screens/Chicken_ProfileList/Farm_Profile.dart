import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/blocs/profilebloc.dart';

class FarmProfile extends StatefulWidget{
  
  static String tag ='Farm Profile';
  @override
 _FarmProfilePageState  createState() => new _FarmProfilePageState();  
  }
  class _FarmProfilePageState extends State<FarmProfile> {
  @override
  Widget build(BuildContext context) {
      
      final bloc = ProfileBloc();

   Widget logo() {
     return Hero(tag: 'hero', 
          child: CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 40.0,
              child: Image.asset('lib/images/photo.png'),
                        ),
                    );
                 }
  Widget farmname() { 
    return StreamBuilder<String>(
      stream: bloc.farmStream,
      builder:(context, snapshot){
        return TextField(
          keyboardType: TextInputType.text ,
          autofocus: false,
          onChanged: bloc.farmNameChanged,          
          decoration: InputDecoration(
            labelText: 'Farm Name',
            errorText: snapshot.error,
            icon: Icon(Icons.account_box, color: Colors.green),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          ),
        );}
      );
    }

    Widget farmAdress() {
      return StreamBuilder<String>(
          stream: bloc.farmAdressStream,
          builder:(context, snapshot){
            return TextField(
                keyboardType: TextInputType.multiline ,
                autofocus: false,
                onChanged: bloc.farmAdressChanged,
                maxLines: 2,
                decoration: InputDecoration(
                    labelText: 'Farm Adress',
                    errorText: snapshot.error,
                    icon: Icon(Icons.local_library, color: Colors.green),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          ),
        );}
        );
      }
      
    Widget phone() {
      return StreamBuilder<String>(
            stream: bloc.mobileStream,
            builder:(context, snapshot){
              return TextField(
                keyboardType: TextInputType.phone ,
                autofocus: false,
                onChanged: bloc.mobileChanged,
                decoration: InputDecoration(
                      labelText: 'Mobile No.',
                      errorText: snapshot.error,
                      icon: Icon(Icons.phone_iphone, color: Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
              );} 
            );
        }

      Widget otherphone() {
        return StreamBuilder<String>(
            stream: bloc.alternumberStream,
            builder:(context, snapshot){
              return TextField(
                  keyboardType: TextInputType.phone ,
                  autofocus: false,
                  onChanged: bloc.alternumberChanged,
                  decoration: InputDecoration(
                      labelText: 'Enter Alternate Mobile No.',
                      errorText: snapshot.error,
                      icon: Icon(Icons.phone_iphone, color: Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
              );}
            );
          }

      Widget lineId() {
        return StreamBuilder<String>(
              stream: bloc.lineIdStream,
              builder:(context, snapshot){
                return TextField(
                    autofocus: false,
                    onChanged: bloc.lineIdChanged,
                    decoration: InputDecoration(
                        labelText: 'Line Id',
                        errorText: snapshot.error,
                        icon: Icon(Icons.assignment_ind, color: Colors.green),
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  ),
                );}
              );
            }

      Widget socialpage() {
        return StreamBuilder<String>(
            stream: bloc.socialPageStream,
            builder:(context, snapshot){
              return TextField(
                autofocus: false,
                keyboardType: TextInputType.url,
                onChanged: bloc.socialPageChanged,
                decoration: InputDecoration(
                    labelText: 'Social Page',
                    errorText: snapshot.error,
                    icon: Icon(Icons.credit_card, color: Colors.green),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
               );}
             );
         }
  Widget website() {
    return StreamBuilder<String>(
            stream: bloc.anyWebStream,
            builder:(context, snapshot){
              return TextField(
                autofocus: false,
                keyboardType: TextInputType.url,
                onChanged: bloc.anyWebChanged,
                  decoration: InputDecoration(
                      labelText: 'Any Website',
                      errorText: snapshot.error,
                      icon: Icon(Icons.center_focus_weak, color: Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                       ),
                    );}
                );
           }

   Widget aboutus(){
     return StreamBuilder<String>(
            stream: bloc.aboutusStream,
            builder:(context, snapshot){
            return TextField(
                keyboardType: TextInputType.multiline,
                autofocus: false,
                onChanged: bloc.aboutusChanged,
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: 'About Us',
                    errorText: snapshot.error,
                    icon: Icon(Icons.content_paste, color: Colors.green),
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    )
                  );}
                );
           }
        Widget submitButton(){
    //           Padding(
    //           padding: EdgeInsets.symmetric(vertical: 50.0),
              return StreamBuilder<bool>(
                  stream: bloc.submitedbutton,
                  builder:(context, snapshot){
                    return RaisedButton(
                      color: Colors.amber,
                      child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    onPressed: (){},
                   );
                  }
                );
               }

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
         ),
       debugShowCheckedModeBanner: false,
        home: Container(
    //  backgroundColor: Colors.white,
        child: Padding(
         padding: EdgeInsets.only(left: 25.0,right: 25.0),
         child: new Row(
         children: <Widget>[ 
           Flexible(
             flex: 1,
             child: new ListView(
              children: <Widget>[
           SizedBox(height: 8.0),
           logo(),
           SizedBox(height: 10.0),
           farmname(),
           SizedBox(height: 10.0),
           farmAdress(),
           SizedBox(height: 10.0),
           phone(),
           SizedBox(height: 10.0),
           otherphone(),
           SizedBox(height: 10.0),
           lineId(),
           SizedBox(height: 10.0),
           website(),
           SizedBox(height: 10.0),
           socialpage(),
           SizedBox(height: 10.0),
           aboutus(),
           SizedBox(height: 25.0,),
           submitButton(),
         ],
         ),
         ),
         ],
         ))), );
  }
  }