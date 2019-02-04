import 'package:flutter/material.dart';



import 'package:flutter_app/Screens/Navigationdraw.dart';
import 'package:flutter_app/Screens/Sales/AnimalSale.dart';
import 'package:flutter_app/Screens/Sales/Pricelist.dart';
import 'package:flutter_app/Screens/Sales/SaleEntrylist.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class SalesTab extends StatefulWidget {
  @override
  SalesTabState createState() => SalesTabState();
  }
  class SalesTabState extends State<SalesTab>with SingleTickerProviderStateMixin {

  TabController tabController;
  ScrollController scrollController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length:3, vsync: this);
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
            elevation: 15.0,
            title: Text('SALE DETAILS'),
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
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.white54,
              tabs: <Widget>[
                Tab(
                  text: "Price List",
                ),
                Tab(
                  text: "Animal Sale",
                ),
                Tab(
                  text: "Sale Entry",
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
          new PriceList(),
        ),
          new Container(
          child:
          new AnimalSaleList(),
        ),
        new Container(
          child:
          new SaleEntryList(),
        ),
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}