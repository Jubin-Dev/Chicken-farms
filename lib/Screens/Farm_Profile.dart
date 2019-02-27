import 'package:flutter/material.dart';

class FarmProfile extends StatefulWidget{
  
  static String tag ='Farm Profile';
  @override
 _FarmProfilePageState  createState() => new _FarmProfilePageState();  
  }
  class _FarmProfilePageState extends State<FarmProfile> {
  @override
  Widget build(BuildContext context) {
   final logo = Hero(tag: 'hero', 
        child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 40.0,
         child: Image.asset('lib/images/photo.png'),
       ),
       );
      final farmname = TextFormField(
          keyboardType: TextInputType.text ,
          autofocus: false,
        decoration: InputDecoration(
          hintText: 'Farm Name',
          suffixIcon: Icon(Icons.account_box, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0),
            
          // )
        ),
      );
      final farmAdress = TextFormField(
        keyboardType: TextInputType.multiline ,
        autofocus: false,
        // initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Farm Adress',
          suffixIcon: Icon(Icons.local_library, color: Colors.green),
         contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(25.0),
            
          // )
        ),
      );
      final phone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Enter Your Mobile No.',
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green),
         contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          
        ),
      );
      final otherphone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        // initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Enter Alternate Mobile No.',
          suffixIcon: Icon(Icons.phone_iphone, color: Colors.green),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          
        ),
      );
   final lineId = TextFormField(
     autofocus: false,
    //  obscureText: true,
     decoration: InputDecoration(
         hintText: 'Line Id',
         suffixIcon: Icon(Icons.assignment_ind, color: Colors.green),
         contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
       
     ),
   );
   final socialpage = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.url ,
      decoration: InputDecoration(
         hintText: 'Social Page',
         suffixIcon: Icon(Icons.credit_card, color: Colors.green),
         contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //  border: OutlineInputBorder(
        //    borderRadius: BorderRadius.circular(25.0),
        //  )
     ),
   );
   final website = TextFormField(
     autofocus: false,
    keyboardType: TextInputType.url ,
     decoration: InputDecoration(
         hintText: 'Any Website',
         suffixIcon: Icon(Icons.center_focus_weak, color: Colors.green),
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //  border: OutlineInputBorder(
        //    borderRadius: BorderRadius.circular(25.0),
        //  )
     ),
   );
   final aboutus = TextFormField(
        keyboardType: TextInputType.multiline ,
        autofocus: false,
        
        decoration: InputDecoration(
          hintText: 'About Us',
           suffixIcon: Icon(Icons.content_paste, color: Colors.green),
         contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(35.0),
            
            
          )
        );
      
   
   final submitButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Material(
        borderRadius: BorderRadius.circular(30.0),
       shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 7.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 47.0,
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
      home: Scaffold(
     backgroundColor: Colors.white,
     body: Padding(
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