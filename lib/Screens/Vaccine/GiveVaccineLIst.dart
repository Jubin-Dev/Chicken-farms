import 'package:flutter/material.dart';


import 'package:flutter_app/Screens/Home_page.dart';
import 'package:flutter_app/Screens/Vaccine/GiveVaccine.dart';


class GiveVaccineList extends StatefulWidget{
  
  static String tag ='Give Vaccine List';
  @override
 GiveVaccineListState  createState()=> new GiveVaccineListState(); 
    
  }
  
  class GiveVaccineListState extends State<GiveVaccineList> {
  @override
  Widget build(BuildContext context) {

   
    return MaterialApp(
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ) ,
      home: Scaffold(
        
     appBar: AppBar(
       title: Text('Given Vaccine'),
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
                 context, MaterialPageRoute(builder: (context) => GiveVaccine())),
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