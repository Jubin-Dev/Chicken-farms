import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/ChickenTreatment/MedicineDetails.dart';
import 'package:flutter_app/Screens/ChickenTreatment/TreatmentDetail.dart';
// import 'package:flutter_app/Screens/ChickenTreatment/PurchasedMedicine.dart';
void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class Chicktreat extends StatefulWidget {
  @override
  ChicktreatState createState() => ChicktreatState();
  }
  class ChicktreatState extends State<Chicktreat>{

  // TabController tabController;
  // ScrollController scrollController;
  // @override
  // void initState(){
  //   super.initState();
  //   tabController = TabController(length:2, vsync: this);
  //   scrollController = ScrollController();
  // }
  // @override
  // void dispose() {
  //   tabController.dispose();
  //   scrollController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: new ThemeData(
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.amber,
        tabBarTheme: TabBarTheme(
        labelColor: Color(0xFFFFFFFF),
        ),
     ),
     debugShowCheckedModeBanner: false,
    //  home: Container(
    //   child: NestedScrollView(
    //   controller: scrollController,
    //   headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
    //     return<Widget>[
    //       SliverAppBar(
    //         backgroundColor: Colors.amber,
    //         elevation: 15.0,
    //         title: Text('TREATMENT DETAILS'),
    //         expandedHeight: 100.0,
    home: new DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onPressed: () {Navigator.pop(context);
                   }
                 ),
            // centerTitle: true,
            // pinned: true,
            // floating: false,
            // forceElevated: boxIsScrolled,
            bottom: new TabBar(
              isScrollable: true,
              indicatorColor: Colors.green,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width:2.0,color: Colors.teal),  
                      ), 
                labelStyle: TextStyle(fontSize: 20.0),
                unselectedLabelColor: Colors.white54,
                tabs: <Widget>[
                    Tab(
                      text: "Chicken Treatment",
                      icon: Icon(Icons.local_hospital, color: Colors.white,size: 30.0,),
                      ),
                    Tab(
                      text: "Purchased Medicine",
                      icon: Icon(Icons.local_pharmacy, color: Colors.white,size: 30.0,),
                    ),
                  ],
              // controller: tabController,
                ),
                ),
        
    body: TabBarView(children: <Widget>[
          new Treatmentlist(),
          new PurchMedicineList(),
            ],
        // controller: tabController,
          ),
        )
      )
   );
  }
}