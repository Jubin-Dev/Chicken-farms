import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appName = 'Chicken Farm';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amberAccent[450],
        accentColor: Colors.cyan,
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
          body1: TextStyle(fontSize: 15.0, fontFamily: 'Raleway'),
          ),
          ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() =>_SplashScreenState() ;
  }
  class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3),() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginPage()),
    )
    );
  }
//        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>
//    new LoginPage())));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.amberAccent[200]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              Expanded(
                flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white54,
                          radius: 60.0,
                          child: Image(
                            image: AssetImage('lib/images/rooster.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10.0),
                        ),
                        Text("CHICKEN FARM",style: TextStyle(color:
                        Colors.green ,fontSize: 24.0,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text("Smart Care \n For Chickens",
                      style: TextStyle(color: Colors.green,fontSize: 18.0,fontWeight: FontWeight.w400),
                      )
                    ],

              ))
            ],

          )
        ],
      ),

    );
  }
}



