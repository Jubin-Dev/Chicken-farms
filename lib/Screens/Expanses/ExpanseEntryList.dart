import 'package:flutter/material.dart';

import 'package:flutter_app/Screens/Expanses/ExpenseEntry.dart';



class ExpenseEntryList extends StatefulWidget{
  
  static String tag ='ExpensesEntryList';
  @override
 ExpenseEntryPageState  createState()=> new ExpenseEntryPageState(); 
    
  }
  
  class ExpenseEntryPageState extends State<ExpenseEntryList> {
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
    //    title: Text('Expense Entry'),
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
                 context, MaterialPageRoute(builder: (context) => ExpenseDetail())),
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