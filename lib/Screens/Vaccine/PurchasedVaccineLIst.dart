import 'package:flutter/material.dart';


import 'package:flutter_app/Screens/Home_page.dart';
import 'package:flutter_app/Screens/Vaccine/PurchasedVaccine.dart';
import 'package:flutter_app/Screens/Vaccine/Vaccine_Schedule.dart';

class PurchasedVaccineList extends StatefulWidget{
  
  static String tag ='Purchased Vaccine List';
  @override
 PurchasedVaccineListState  createState()=> new PurchasedVaccineListState(); 
    
  }
  
  class PurchasedVaccineListState extends State<PurchasedVaccineList> {
  @override
  Widget build(BuildContext context) {

   
    return MaterialApp(
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ) ,
      home: Scaffold(
        
     appBar: AppBar(
       title: Text('Purchased Vaccine'),
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
                 context, MaterialPageRoute(builder: (context) => PurchVaccine())),
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