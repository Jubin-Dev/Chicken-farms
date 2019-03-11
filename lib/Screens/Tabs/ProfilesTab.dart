import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/Farm_Profile.dart';

import 'package:flutter_app/Screens/Navigationdraw.dart';

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
     home: Container(
      child: NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
        return<Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            elevation: 15.0,
            title: Text('PROFILES'),
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
            // forceElevated: boxIsScrolled,
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
                  text: "Farm Profile",
                   icon: Icon(Icons.person_pin, color: Colors.white,size: 36.0,),
                   
                ),
                Tab(
                  text: "Chicken Profile",
                   icon: Icon(Icons.copyright, color: Colors.white,size: 36.0),
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
          new NextPage(),
        ),
         
    ],
        controller: tabController,
    ),
    )

    ) );
  }
}