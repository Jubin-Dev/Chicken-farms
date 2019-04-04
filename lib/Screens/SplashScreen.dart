import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login_page.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState() ;
  }
  class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3),() => Navigator.push(
      context, MaterialPageRoute(builder: (context) =>  LoginPage()),
      )
    );
  }
//        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>
//    new LoginPage())));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.amber[300]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Expanded(
                flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white54,
                          radius: 70.0,
                          child: Image(
                          image: AssetImage('lib/images/rooster.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:50.0),
                            ),
                        Text("CHICKEN FARM",style: TextStyle(color:
                        Colors.teal,fontSize: 25.0,fontWeight: FontWeight.w500,fontFamily: 'TitilliumWeb'),
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
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                      Text("Smart Care For Chickens",
                      style: TextStyle(color: Colors.teal,fontSize: 18.0,fontWeight: FontWeight.w400,fontFamily: 'TitilliumWeb'),
                      )
                    ],
                  )
                )
             ],
          )
        ],
      ),
     )
     );
  }
}