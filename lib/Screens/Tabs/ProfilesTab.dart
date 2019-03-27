import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/Farm_Profile.dart';
import 'package:flutter_app/Screens/Home_page.dart';


class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
  }
  class ProfileState extends State<Profile>{
  // with SingleTickerProviderStateMixin {

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
     home:new DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  // title: Text('Profile'),
                  // centerTitle: true,
              // NestedScrollView(
              //     controller: scrollController,
              //     headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
              //               return<Widget>[
              //                 SliverAppBar(
              //                   backgroundColor: Colors.amber,
              //                   elevation: 15.0,
              //                   title: Text('PROFILES'),
              //                   expandedHeight: 100.0,
            leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: () {Navigator.pop(context);
            // => MyHomes(),
              
            }  
            ),
            // centerTitle: true,
            // pinned: true,
            // floating: false,
            // forceElevated: boxIsScrolled,

           bottom:new TabBar(
              isScrollable: true,
              indicatorColor: Colors.blue,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width:2.0,color: Colors.teal),  
              ), 
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.white54,
              tabs: <Widget>[
                Tab(
                  text: "Farm Profile",
                   icon: Icon(Icons.person_pin, color: Colors.white,size: 30.0,),
                    ),
                Tab(
                  text: "Chicken Profile",
                   icon: Icon(Icons.copyright, color: Colors.white,size: 30.0),
                   ),
                  ],
                // controller: tabController,
                 ),
                 
                ),
                
      body: TabBarView(children: <Widget>[
          new FarmProfile(),
          new NextPage(),
          ],
          // controller: tabController,
          ),
        ),
      ), 
    );
  }
}