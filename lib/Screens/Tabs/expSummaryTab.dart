import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/DashboardItems/SaleReport.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';
import 'package:flutter_app/Screens/Sales/sale_summary.dart';

class ExpSummaryTab extends StatefulWidget {
  @override
  ExpSummaryState createState() => ExpSummaryState();
  }
  class ExpSummaryState extends State<ExpSummaryTab>with SingleTickerProviderStateMixin {

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
            elevation: 20.0,
            title: Text('Details'),
            expandedHeight: 80.0,
      //       leading: IconButton(
      //       icon: Icon(Icons.arrow_back_ios),
      //       onPressed: () => Navigator.push (
      //       context, MaterialPageRoute(builder: (context) => NavPage(),
      //        ),
      //     ),
      //  ),
            centerTitle: true,
            pinned: true,
            floating: false,
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
                  text: "Expenses Report",
                  icon: Icon(Icons.line_style, color: Colors.white,size: 36.0),
                    ),
                Tab(
                  text: "Expenses Summary",
                  icon: Icon(Icons.library_books, color: Colors.white,size: 36.0),
                )
              ],
              controller: tabController,
            ),
          )
        ];
      },
      body: TabBarView(children: <Widget>[
          
          new ReportSale(),
       
          new SaleSummary(),
        
         
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}