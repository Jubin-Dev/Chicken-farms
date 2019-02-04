import 'package:flutter/material.dart';


void main() => runApp(new ReportSummary());

class ReportSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new ReportSummaryPage(title: 'Sales Summary'),
    );
  }
}

class ReportSummaryPage extends StatefulWidget {
  ReportSummaryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ReportSummaryPageState createState() => new _ReportSummaryPageState();
}

class _ReportSummaryPageState extends State<ReportSummaryPage> {

  

  
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
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.amber,
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              
              autovalidate: true,
              child: new ListView (
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
                   Divider(),

                   new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'To Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                   Divider(),
                    
                
                         
                 
                       
                    ],
                      ))),
                );
              }
              }