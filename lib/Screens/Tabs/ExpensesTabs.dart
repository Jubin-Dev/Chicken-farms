import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Expanses/ExpenseEntry.dart';
import 'package:flutter_app/Screens/Expanses/MasterExp.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class ExpTab extends StatefulWidget {
  @override
  ExpTabState createState() => ExpTabState();
  }
  class ExpTabState extends State<ExpTab>with SingleTickerProviderStateMixin {

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
     home: Scaffold(
      body: NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
        return<Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            elevation: 15.0,
            title: Text('EXPENSES'),
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
                  text: "Master Expense",
                   icon: Icon(Icons.explicit, color: Colors.white,),
                ),
                Tab(
                  text: "Expense Entry",
                   icon: Icon(Icons.event_note, color: Colors.white,),
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
          new ExpList(),
        ),
          new Container(
          child:
          new ExpEntryList(),
        ),
    ],
        controller: tabController,
    ),
    )
    )
    );
  }
}