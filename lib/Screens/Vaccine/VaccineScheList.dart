import 'package:flutter/material.dart';


import 'package:flutter_app/Screens/Vaccine/Vaccine_Schedule.dart';

class VaccineScheduleList extends StatefulWidget{
  
  static String tag ='ScheduleList';
  @override
 VaccineScheduleListState  createState()=> new VaccineScheduleListState(); 
    
  }
  
  class VaccineScheduleListState extends State<VaccineScheduleList> {
  @override
  Widget build(BuildContext context) {

   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ) ,
      home: Scaffold(
        
    //  appBar: AppBar(
    //    title: Text('Vaccine Schedule'),
    //    centerTitle: true,
    //    backgroundColor: Colors.amber,
    //    leading: IconButton(
    //      icon: Icon(Icons.arrow_back_ios),
    //      onPressed: () => Navigator.push (
    //       context, MaterialPageRoute(builder: (context) => MyHomes(),
    //    ),
    //  ),
    //    )
    //  ),
     backgroundColor: Colors.white,
     body: BodyWidget(),
          floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add,color: Colors.white,),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Vaccine())),
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