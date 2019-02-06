import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';
import 'package:flutter_app/Screens/Vaccine/GiveVaccineLIst.dart';
import 'package:flutter_app/Screens/Vaccine/PurchasedVaccineLIst.dart';
import 'package:flutter_app/Screens/Vaccine/VaccineScheList.dart';
import 'package:flutter_app/Screens/Vaccine/Vaccine_due.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class VaccineTab extends StatefulWidget {
  @override
  VaccineTabState createState() => VaccineTabState();
  }
  class VaccineTabState extends State<VaccineTab>with SingleTickerProviderStateMixin {

  TabController tabController;
  ScrollController scrollController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController();
  }
  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
      body: NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
        return<Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            elevation: 20.0,
            title: Text('VACCINE'),
            expandedHeight: 180.0,
            leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.push (
            context, MaterialPageRoute(builder: (context) => NavPage(),
             ),
     ),
       ),
            centerTitle: true,
            pinned: true,
            floating: false,
            forceElevated: boxIsScrolled,
            bottom: new TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width:1.0),  
              ),
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.white54,
              
              tabs: <Widget>[
                Tab(
                  text: "Vaccine\nSchedule",
                ),
                Tab(
                  text: "Purchased\nVaccine",
                ),
                Tab(
                  text: "Give\nVaccine",
                ),
                Tab(
                  text: "Vaccine\nDue",
                  
                )
              ],
              controller: tabController,
            ),
          )
        ];
      },
      body: TabBarView(children: <Widget>[
          new Container(
          child:
          new VaccineScheduleList(),
        ),
          new Container(
          child:
          new PurchasedVaccineList(),
        ),
          new Container(
          child:
          new GiveVaccineList(),
        ),
          new Container(
          child:
          new Vaccinedue(),
        ),
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}