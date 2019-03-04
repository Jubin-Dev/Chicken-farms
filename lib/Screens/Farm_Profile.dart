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

   final logo = Hero(tag: 'hero', 
        child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 40.0,
         child: Image.asset('lib/images/photo.png'),
       ),
       );
      final farmname = StreamBuilder<String>(
            stream: bloc.farmStream,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.text ,
          autofocus: false,
          onChanged: bloc.farmNameChanged,
          decoration: InputDecoration(
          hintText: 'Farm Name',
          suffixIcon: Icon(Icons.account_box, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
    ),);
      final farmAdress = StreamBuilder<String>(
            stream: bloc.farmAdressStream,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.multiline ,
          autofocus: false,
          onChanged: bloc.farmAdressChanged,
          decoration: InputDecoration(
          hintText: 'Farm Adress',
          suffixIcon: Icon(Icons.local_library, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      ));
      final phone = StreamBuilder<String>(
            stream: bloc.mobileStreem,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.phone ,
          autofocus: false,
          onChanged: bloc.mobileChanged,
          // initialValue: '+91-',
          decoration: InputDecoration(
          hintText: 'Enter Your Mobile No.',
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          
        ),
       ), );
      final otherphone = StreamBuilder<String>(
            stream: bloc.alternumberStream,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.phone ,
          autofocus: false,
          onChanged: bloc.alternumberChanged,
        // initialValue: '+91-',
          decoration: InputDecoration(
          hintText: 'Enter Alternate Mobile No.',
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          
        ),
       ) );
   final lineId = StreamBuilder<String>(
            stream: bloc.lineIdStream,
            builder:(context, snapshot)=>
          TextField(
          autofocus: false,
          onChanged: bloc.lineIdChanged,
   
          decoration: InputDecoration(
          hintText: 'Line Id',
          suffixIcon: Icon(Icons.assignment_ind, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
       
     ),
    ) );
   final socialpage = StreamBuilder<String>(
            stream: bloc.socialPageStream,
            builder:(context, snapshot)=>
          TextField(
          autofocus: false,
          keyboardType: TextInputType.url,
          onChanged: bloc.socialPageChanged,
          decoration: InputDecoration(
          hintText: 'Social Page',
          suffixIcon: Icon(Icons.credit_card, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
     ),
    ), );
   final website = StreamBuilder<String>(
            stream: bloc.anyWebStream,
            builder:(context, snapshot)=>
        TextField(
        autofocus: false,
        keyboardType: TextInputType.url,
        onChanged: bloc.anyWebChanged,
        decoration: InputDecoration(
         hintText: 'Any Website',
         suffixIcon: Icon(Icons.center_focus_weak, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //  border: OutlineInputBorder(
        //    borderRadius: BorderRadius.circular(25.0),
        //  )
     ),
    ), );
   final aboutus = StreamBuilder<String>(
            stream: bloc.aboutusStream,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.multiline ,
          autofocus: false,
          onChanged: bloc.aboutusChanged,
          decoration: InputDecoration(
          hintText: 'About Us',
            suffixIcon: Icon(Icons.content_paste, color: Colors.green),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            
          )
           ) );

   final submitButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child:StreamBuilder<bool>(
            stream: bloc.submitbutton,
            builder:(context, snapshot)=>
        RaisedButton(
          // minWidth: 200.0,
          // height: 47.0,
          onPressed: (){},
           
          color: Colors.amber,
          child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),

        ) ,
     ),
   );
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
         padding: EdgeInsets.only(left: 24.0,right: 24.0),
         child: new Row(
         
         children: <Widget>[ 
           Flexible(
             flex: 1,
             child: new ListView(
               children: <Widget>[
           SizedBox(height: 20.0),
           logo,
           SizedBox(height: 20.0),
           farmname,
           SizedBox(height: 20.0),
           farmAdress,
           SizedBox(height: 20.0),
           phone,
           SizedBox(height: 20.0),
           otherphone,
           SizedBox(height: 20.0),
           lineId,
           SizedBox(height: 20.0),
           website,
           SizedBox(height: 20.0),
           socialpage,
           SizedBox(height: 20.0),
           aboutus,
           SizedBox(height: 1.0,),
           submitButton,
         ],
       ),
     ),
         ],
      ))), );
  }
  }