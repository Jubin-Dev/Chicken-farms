import 'package:flutter/material.dart';

import 'package:flutter_app/Screens/Sales/PriceDetail.dart';
import 'package:flutter_app/Screens/Sales/SaleDetails.dart';

class AnimalSaleList extends StatefulWidget{
  
  static String tag ='AnimalSaleList';
  @override
 _AnimalSalePageState  createState()=> new _AnimalSalePageState(); 
    
  }
  
  class _AnimalSalePageState extends State<AnimalSaleList> {
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
                 context, MaterialPageRoute(builder: (context) => SaleDetail())),
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