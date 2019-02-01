import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Dashboard.dart';
import 'package:flutter_app/Screens/IconDashboard.dart';
import 'IconDashboard.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
             floating: true,
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(  
              background: HorizontalList(),          // try to horintal list view

            ),


          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Card(
                  child: DashIcons(),
                )
                
              ]

            ),
          )

        ],
      )

    );
  }
}
    
  

