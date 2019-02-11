import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/DashboardItems/ReportsSummary.dart';
import 'package:flutter_app/Screens/DashboardItems/SaleReport.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';
import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';


void main() => runApp(MyHomes());

class MyHomes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
       theme: new ThemeData(
        primarySwatch: Colors.amber,
       ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
          );
        }
      }
      
      class MyHomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
        }
  
  class _MyhomePageState extends State<MyHomePage> {
   
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      drawer: new DrawerOnly(),
      
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          actions: <Widget>[
           new IconButton(icon: Icon(Icons.search),color: Colors.black,
           onPressed: () {},
            )
          ],
        ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 70.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(1.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
                  
                  borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(20), 
                    bottomLeft:Radius.circular(20),
                    
                  )

                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                         Padding(
                           
                      padding:const EdgeInsets.only(top: 5.0,left: 115.0 ),
                      
                        child: CircleAvatar(    
                      backgroundColor: Colors.white54,
                      radius: 70.0,
                    
                     child: Image.asset('lib/images/rooster.png'),
                    ),
                        
                         )  
                      ],

                    ),
                  //   Padding(
                  //     padding:const EdgeInsets.only(top: 10.0 ),
                  //  child :Text('Chicken Farm'.toUpperCase(),
                  //  style: TextStyle(
                  //    color: Colors.teal,
                  //    fontSize: 24.0,
                  //    fontFamily: 'Roboto',
                  //    fontWeight: FontWeight.bold,
                  //  ),
                  //  ),
                  //    ),
                    
                     Padding(
                       padding: const EdgeInsets.only(top: 15,bottom: 32),
                     
                     child:Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Column(
                           children: <Widget>[
                             Text('Sales',style: TextStyle(fontSize: 16.0),),
                             IconButton(icon: Icon(Icons.assessment, color: Colors.white, ),
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ReportSale())),
                             )
                           ],
                         ),
                         Column(
                           children: <Widget>[
                             Text('Expenses',style: TextStyle(fontSize: 16.0),),
                             IconButton(icon: Icon(Icons.monetization_on, color: Colors.white,  ),
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ReportSale())), 
                             )
                           ],
                         ),
                         Column(
                           children: <Widget>[ 
                             Text('Profit/Loss',style: TextStyle(fontSize: 16.0),),   
                             IconButton(icon: Icon(Icons.money_off, color: Colors.white, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ReportSummary())),        
                             )
                           ],
                         ),
                          Column(
                           children: <Widget>[   
                             Text('Stock',style: TextStyle(fontSize: 16.0),), 
                             IconButton(icon: Icon(Icons.multiline_chart, color: Colors.white, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ReportSummary())),        
                             )
                           ],
                         )
                       ],
                     )
                     ),],
                ),
     ),
     Container(
       padding: EdgeInsets.all(20.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               
                Column(
            children: <Widget>[
                 Text('Profiles',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.account_circle, color: Colors.green, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Profile())),
                
                             )
            ],
               ),
            Column(
            children: <Widget>[
                Text('Treatment',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.local_hospital, color: Colors.green, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Chicktreat())),        
                             ),
                             
              
            ],
               ),
               Column(
            children: <Widget>[
               Text('Vaccine',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.business_center, color: Colors.green, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => VaccineTab())),        
                             ),
                             

             ],
           )
         ],

       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Column(
            children: <Widget>[
               Text('Expenses',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.monetization_on, color: Colors.green, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ExpTab())),        
                             )
            ],
               ),
                Column(
            children: <Widget>[
               Text('Sales',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.assessment, color: Colors.green, ),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => SalesTab())),        
                             )
            ],
               ),
                Column(
            children: <Widget>[
              Text('Breed List',style: TextStyle(fontSize: 16.0),),
              IconButton(icon: Icon(Icons.assignment, color: Colors.green,),      
                             iconSize: 66.0,
                             onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Profile())),        
                             ),
                             
              
            ],
               ),
               

         ],

       ),

         ]),

     )],
          ),
    );

  
  }
}
    
  

