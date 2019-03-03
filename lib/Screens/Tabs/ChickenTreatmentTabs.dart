import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/ChickenTreatment/MedicineDetails.dart';
import 'package:flutter_app/Screens/ChickenTreatment/TreatmentDetail.dart';
// import 'package:flutter_app/Screens/ChickenTreatment/PurchasedMedicine.dart';


import 'package:flutter_app/Screens/Navigationdraw.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class Chicktreat extends StatefulWidget {
  @override
  ChicktreatState createState() => ChicktreatState();
  }
  class ChicktreatState extends State<Chicktreat>with SingleTickerProviderStateMixin {

  TabController tabController;
  ScrollController scrollController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length:2, vsync: this);
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
     home: Container(
      child: NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
        return<Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            elevation: 15.0,
            title: Text('TREATMENT DETAILS'),
            expandedHeight: 160.0,
            leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.push (
            context, MaterialPageRoute(builder: (context) => NavPage(),
             ),
     ),
       ),
            centerTitle: true,
            pinned: true,
            floating: true,
            forceElevated: boxIsScrolled,
            bottom: new TabBar(
              
              isScrollable: true,
              indicatorColor: Colors.green,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width:1.0),  
              ), 
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.white54,
              tabs: <Widget>[
                Tab(
                  text: "Chicken Treatment",
                  icon: Icon(Icons.local_hospital, color: Colors.white,size: 40.0,),
                ),
                Tab(
                  text: "Purchased Medicine",
                  icon: Icon(Icons.local_pharmacy, color: Colors.white,size:40.0,),
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
          new Treatmentlist(),
        ),
          new Container(
          child:
          new PurchMedicineList(),
        ),
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}