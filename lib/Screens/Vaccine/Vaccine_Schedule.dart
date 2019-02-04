import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';

void main() => runApp(new Vaccine());

class Vaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new VaccinePage(title: 'Vaccine Schedule'),
    );
  }
}

class VaccinePage extends StatefulWidget {
  VaccinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VaccinePageState createState() => new _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
        onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => VaccineTab())),
        
       ) ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.all(45.0),
                children: <Widget>[
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Animal Age',
                       
                    ),
                  ),

                  Divider(

                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Vaccine Name',
                      
                    ),
                  ),

                  Divider(

                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Vaccine Type',
                      
                    ),
                  ),
                   Divider(

                  ),

                   new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Vaccine Company',
                      
                    ),
                  ),
                   Divider(

                  ),
                  
                     
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Remarks',
                      
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                 
                    new Container(
                    child: new Padding(
                     padding: EdgeInsets.symmetric(vertical: 80.0),
                    child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                   elevation: 6.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                  height: 47.0,
                  onPressed: (){},
                  color: Colors.amber,
                  child: Text('Add',style:TextStyle(color:Colors.black,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    ],
                      ))),
                );
              }
              }