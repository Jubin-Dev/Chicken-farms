import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Expanses/ExpenseEntry.dart';
import 'package:flutter_app/Screens/Expanses/MasterExp.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class ExpTab extends StatefulWidget {
  @override
  ExpTabState createState() => ExpTabState();
  }
  class ExpTabState extends State<ExpTab>{

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
    //         title: Text('EXPENSES'),
    //         expandedHeight: 160.0,
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
                  text: "Master Expense",
                   icon: Icon(Icons.equalizer, color: Colors.white,size: 36.0,),
                    ),
              Tab(
                  text: "Expense Entry",
                   icon: Icon(Icons.event_note, color: Colors.white,size: 36.0,),
                    ),
                  ],
              // controller: tabController,
                  ),
                ),
      body: TabBarView(children: <Widget>[
          new ExpList(),
          new ExpEntryList(),
            ],
        // controller: tabController,
          ),
        )
      )
    );
  }
}