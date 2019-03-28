import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Sales/PriceDetail.dart';
import 'package:flutter_app/Screens/Sales/SaleDetails.dart';
import 'package:flutter_app/Screens/Sales/SaleEntryDetail.dart';
void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class SalesTab extends StatefulWidget {
  @override
  SalesTabState createState() => SalesTabState();
  }
  class SalesTabState extends State<SalesTab>{

  // TabController tabController;
  // ScrollController scrollController;
  // @override
  //   void initState(){
  //   super.initState();
  //   tabController = TabController(length:3, vsync: this);
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
    //         title: Text('SALE DETAILS'),
    //         expandedHeight: 160.0,
     home:new DefaultTabController(
              length: 3,
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
                  icon: Icon(Icons.filter_list, color: Colors.white,size:36.0,),
                  text: "Price List",
                ),
                Tab(
                  icon: Icon(Icons.pets, color: Colors.white,size:36.0,),
                  text: "AnimalSale",
                ),
                Tab(
                  text: "Sale Entry",
                  icon: Icon(Icons.event_note, color: Colors.white,size:36.0,),
                )
              ],
              // controller: tabController,
            ),
          ),
      
      body: TabBarView(children: <Widget>[
         
          new PriceDetailList(),
       
          new AnimalSaleList(),
      
          new SaleEntrydetail(),
       
          ],
        // controller: tabController,
          ),
        )
    ) );
  }
}