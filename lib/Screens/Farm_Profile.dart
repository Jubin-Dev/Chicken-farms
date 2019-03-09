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
          labelText: 'Farm Name',
          icon: Icon(Icons.account_box, color: Colors.green),
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
          labelText: 'Farm Adress',
          icon: Icon(Icons.local_library, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      ));
      
      final phone = StreamBuilder<String>(
            stream: bloc.mobileStream,
            builder:(context, snapshot)=>
          TextField(
          keyboardType: TextInputType.phone ,
          autofocus: false,
          onChanged: bloc.mobileChanged,
          // initialValue: '+91-',
          decoration: InputDecoration(
          labelText: 'Mobile No.',
          icon: Icon(Icons.phone_iphone, color: Colors.green),
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
          labelText: 'Enter Alternate Mobile No.',
          icon: Icon(Icons.phone_iphone, color: Colors.green),
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
          labelText: 'Line Id',
          icon: Icon(Icons.assignment_ind, color: Colors.green),
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
            labelText: 'Social Page',
            icon: Icon(Icons.credit_card, color: Colors.green),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
           ),
            ),
             );

   final website = StreamBuilder<String>(
            stream: bloc.anyWebStream,
            builder:(context, snapshot)=>
              TextField(
              autofocus: false,
              keyboardType: TextInputType.url,
              onChanged: bloc.anyWebChanged,
              decoration: InputDecoration(
              labelText: 'Any Website',
              icon: Icon(Icons.center_focus_weak, color: Colors.green),
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
            keyboardType: TextInputType.multiline,
            autofocus: false,
            onChanged: bloc.aboutusChanged,
            decoration: InputDecoration(
            labelText: 'About Us',
            icon: Icon(Icons.content_paste, color: Colors.green),
            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            )
            ) );

   final submitButton = Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child:StreamBuilder<bool>(
            // stream: bloc.submitedbutton ,
            builder:(context, snapshot)=>
            RaisedButton(
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
         padding: EdgeInsets.only(left: 25.0,right: 25.0),
         child: new Row(
         children: <Widget>[ 
           Flexible(
             flex: 1,
             child: new ListView(
              children: <Widget>[
           SizedBox(height: 8.0),
           logo,
           SizedBox(height: 10.0),
           farmname,
           SizedBox(height: 10.0),
           farmAdress,
           SizedBox(height: 10.0),
           phone,
           SizedBox(height: 10.0),
           otherphone,
           SizedBox(height: 10.0),
           lineId,
           SizedBox(height: 10.0),
           website,
           SizedBox(height: 10.0),
           socialpage,
           SizedBox(height: 10.0),
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