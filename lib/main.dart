import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/SplashScreen.dart';

void main() { runApp(

  new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chicken Farm',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
        fontFamily: 'TitilliumWeb',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal,color: Colors.white,fontFamily: 'TitilliumWeb'),
          body1: TextStyle(fontSize: 15.0,),
            ),
          ),
      home: new SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/SplashApp':(BuildContext context) => new SplashScreen(),

        },
      )  
    );
  }





