import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/Chicken_ProfileList.dart';
import 'package:flutter_app/Screens/Farm_Profile.dart';
import 'package:flutter_app/Screens/Navigationdraw.dart';

void main() {
  runApp(TabBar(tabs: <Widget>[],));
}
class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
  }
  class ProfileState extends State<Profile>with SingleTickerProviderStateMixin {

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
            title: Text('PROFILES'),
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
                  text: "Farm Profile",
                ),
                Tab(
                  text: "Chicken Profile",
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
          new FarmProfile(),
        ),
          new Container(
          child:
          new ChickenProfile(),
        ),
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}