import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/Screens/Home_page.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';
import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';


void main()=> runApp(new MyNav());

class MyNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: defaultTargetPlatform == TargetPlatform.android
        ? Colors.amber : null,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal,color: Colors.white),
          body1: TextStyle(fontSize: 15.0, fontFamily: 'Roboto'
          ),
          ),
      ),
      home: new NavPage(),
    
      
          );
        }
      }

class DrawerOnly extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return  new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("JUBIN SURYA"),
                accountEmail: new Text("9039893947"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text("J"),
                ),
                otherAccountsPictures: <Widget>[
                  new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text("S"),
                ),

                ],


              ),
              new ListTile(
                title: new Text("Profile"),
                leading: new Icon(Icons.account_circle, color: Colors.green),
                onTap: () { Navigator.pop(context);
               Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Profile()));
                 },
                  ),
              // new ListTile(
              //   title: new Text("Farm Profile"),
              //   leading: new Icon(Icons.account_balance),
              //   onTap: () => Navigator.push(
              //    context, MaterialPageRoute(builder: (context) => FarmProfile())),
                 
              // ),
              // new ListTile(
              //   title: new Text("Chicken Profile List"),
              //   leading: new Icon(Icons.account_balance),
              //     onTap: () => Navigator.push(
              //    context, MaterialPageRoute(builder: (context) => ChickenProfile())),
              // ),
             
              new ListTile(
                title: new Text("Chicken Treatment"),
                leading: new Icon(Icons.local_hospital, color: Colors.green),
                 onTap: () { Navigator.pop(context);
                   Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Chicktreat()));
                 }
              
              ),
               new ListTile(
                title: new Text("Vaccine"),
              leading: new Icon(Icons.business_center, color: Colors.green),
               onTap: () { 
                 Navigator.pop(context);
                 Navigator.push(
                 context, MaterialPageRoute(builder: (context) => VaccineTab()));
               }
              ),
              new ListTile(
                title: new Text("Breed List"),
                leading: new Icon(Icons.assignment, color: Colors.green),
                 onTap: () {
                   Navigator.pop(context);
                    Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Chicktreat()));
                 }
              ),
              
              new Divider(color: Colors.yellow,

              ),
              
              new ListTile(
                title: new Text("Expense"),
                leading: new Icon(Icons.monetization_on, color: Colors.green,),
                 onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ExpTab()));
            } ),
              new ListTile(
                title: new Text("Sales"),
                leading: new Icon(Icons.assessment, color: Colors.green),
                 onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                 context, MaterialPageRoute(builder: (context) => SalesTab()));
                 
                  } ),
              new ListTile(
                title: new Text("Stock out"),
                leading: new Icon(Icons.multiline_chart, color: Colors.green),
                 onTap: () { 
                   Navigator.pop(context);
                   Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Chicktreat()));
                  } ),
              new ListTile(
                title: new Text("Logout"),
               leading: new Icon(Icons.lock_outline, color: Colors.green),
                onTap: () {
                   Navigator.pop(context);
                   Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Chicktreat()));
                }),
            ],
          )
      );
  }

}
      
  class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Home'),
      //   centerTitle: true,
      //    actions: <Widget>[
      //      new IconButton(icon: Icon(Icons.search),
      //     onPressed: () {},
      //       )
      //     ],
      //   // elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0 ,
      // ),
      
      

      
      body: new Container(
        child:new Center(
           
        child:
          new MyHomes(),
        ),
          
        ),

      );
    
  }
  
}




