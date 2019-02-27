import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Home_page.dart';
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
        primaryColor: Colors.green[450],
        accentColor: Colors.green,
        primarySwatch: Colors.green,
        fontFamily: 'TitilliumWeb',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal,color: Colors.white,fontFamily: 'TitilliumWeb'),
          body1: TextStyle(fontSize: 15.0,),
          ),
          ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState() ;
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
                        Colors.teal,fontSize: 25.0,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),
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
                      style: TextStyle(color: Colors.teal,fontSize: 18.0,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
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



