import 'package:flutter/material.dart';


class FarmProfile extends StatefulWidget{
  
  static String tag ='Farm Profile';
  @override
 _FarmProfilePageState  createState()=> new _FarmProfilePageState(); 
    
  }
  
  class _FarmProfilePageState extends State<FarmProfile> {
  @override
  Widget build(BuildContext context) {
   final logo = Hero(tag: 'hero', 
   
       child: CircleAvatar(
         backgroundColor: Colors.yellow,
         radius: 45.0,
         child: Image.asset('lib/images/photo.png'),
       ),
       );
      final farmname = TextFormField(
        keyboardType: TextInputType.text ,
        autofocus: false,
        
        decoration: InputDecoration(
          hintText: 'Farm Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          
        ),
      );
      final otherphone = TextFormField(
        keyboardType: TextInputType.phone ,
        autofocus: false,
        initialValue: '+91-',
        decoration: InputDecoration(
          hintText: 'Enter Alternate Mobile No.',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          
        ),
      );
   final lineId = TextFormField(
     autofocus: false,
    //  obscureText: true,
     decoration: InputDecoration(
         hintText: 'Line Id',
         contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
       
     ),
   );
   final socialpage = TextFormField(
     autofocus: false,
    keyboardType: TextInputType.url ,
     decoration: InputDecoration(
         hintText: 'Social Page',
         contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
         contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(35.0),
            
            
          )
        );
      
   
   final submitButton = Padding(
       padding: EdgeInsets.symmetric(vertical: 50.0),
     child: Material(
       borderRadius: BorderRadius.circular(30.0),
       shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 6.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 47.0,
          onPressed: (){},
           
          color: Colors.yellow,
          child: Text('Submit',style:TextStyle(color:Colors.black,fontSize: 20.0)),

        ) ,
     ),
   );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
    //  appBar: AppBar(
    //    title: Text('Farm Profile'),
    //    centerTitle: true,
    //    backgroundColor: Colors.amberAccent,
    //    leading: IconButton(
    //      icon: Icon(Icons.arrow_back_ios),
    //      onPressed: () => Navigator.push (
    //   context, MaterialPageRoute(builder: (context) => MyHomes(),
    //    ),
    //  ),
    //    )
    //  ),
     backgroundColor: Colors.white,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         padding: EdgeInsets.only(left: 24.0,right: 24.0),
         children: <Widget>[ 
           SizedBox(height: 30.0),
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
           socialpage,
           aboutus,
           SizedBox(height: 1.0,),
           submitButton,
         
           
         ],
       ),
     ),
     ), );
  }
  }