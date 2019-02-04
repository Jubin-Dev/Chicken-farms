import 'package:flutter/material.dart';


void main() => runApp(new Vaccinedue());

class Vaccinedue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new VaccineduePage(title: 'Vaccine Due'),
    );
  }
}

class VaccineduePage extends StatefulWidget {
  VaccineduePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VaccineduePageState createState() => new _VaccineduePageState();
}

class _VaccineduePageState extends State<VaccineduePage> {
  
  DateTime _date = new DateTime.now();
  

Future<Null> _selectedDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2019));

  if (picked != null && picked != _date) {
    print("Date selected ${_date.toString()}");
    setState(() {
      _date = picked;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(widget.title),
      //   centerTitle: true,
      //   leading: Icon(Icons.arrow_back_ios),
      //   backgroundColor: Colors.amber,
      // ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.all( 20.0),
                children: <Widget>[
                 
                  
                        new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'From Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),

                   new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'Upto Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                
                         
                 
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
                  child: Text('Search',style:TextStyle(color:Colors.black,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    ],
                      ))),
                );
              }
              }