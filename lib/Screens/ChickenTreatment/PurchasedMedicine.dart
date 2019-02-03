import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/ChickenTreatment/MedicineDetails.dart';
import 'package:flutter_app/Screens/ChickenTreatment/TreatmentDetail.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/ChickenDetailsForm.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';

import 'package:flutter_app/Screens/Home_page.dart';

class TreatmentList extends StatefulWidget{
  
  static String tag ='TreatmentList';
  @override
 TreatmentListPageState  createState()=> new TreatmentListPageState(); 
    
  }
  
  class TreatmentListPageState extends State<TreatmentList> {
  @override
  Widget build(BuildContext context) {

   
    return MaterialApp(
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ) ,
      home: Scaffold(
        
     appBar: AppBar(
       title: Text('Treatment Entry List'),
       centerTitle: true,
       backgroundColor: Colors.amber,
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: () => Navigator.push (
          context, MaterialPageRoute(builder: (context) => MyHomes(),
       ),
     ),
       )
     ),
     backgroundColor: Colors.white,
     body: BodyWidget(),
          floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Medicine())),
          ), 
          ),
    );
       }
       }
     
     class BodyWidget extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
   
    return new Container();
  }
}