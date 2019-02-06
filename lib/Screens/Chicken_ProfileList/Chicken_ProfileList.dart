import 'package:flutter/material.dart';

import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';



class ChickenProfile extends StatefulWidget{
  
  static String tag ='ChickenProfileList';
  @override
 _ChickenProfileListPageState  createState()=> new _ChickenProfileListPageState(); 
    
  }
  
  class _ChickenProfileListPageState extends State<ChickenProfile> {
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
    //    title: Text('Chicken Profile List'),
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
            child: new Icon(Icons.add),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => DetailApp())),
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