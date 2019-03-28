import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';
import 'package:flutter_app/Screens/DashboardItems/SaleReport.dart';
import 'package:flutter_app/Screens/Sales/sale_summary.dart';

class SaleSummaryTab extends StatefulWidget {
  @override
  SaleSummaryState createState() => SaleSummaryState();
  }
  class SaleSummaryState extends State<SaleSummaryTab>{

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
    //         elevation: 20.0,
    //         title: Text('Details'),
    //         expandedHeight: 120.0,
      home:new DefaultTabController(
                length: 2,
                child: Scaffold(
                appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white),
            onPressed: () {Navigator.pop(context);
              }
             ),
            // centerTitle: true,
            // pinned: true,
            // floating: true,
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
                  text: "Sales Report",
                   icon: Icon(Icons.line_style, color: Colors.white,size: 36.0,),
                ),
                Tab(
                  text: "Sale  Summary",
                   icon: Icon(Icons.library_books, color: Colors.white,size:36.0),
                ),
              ],
              // controller: tabController,
            ),
          ),
     
      body: TabBarView(children: <Widget>[
         
          new ReportSale(),
       
          new SaleSummary(),
         ],
        // controller: tabController,
       ),
      )
    ) );
  }
}