import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Home_page.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

void main() => runApp(new ReportSummary());

class ReportSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
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
  
  final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
 InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MyHomes())),
        ),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              
              autovalidate: true,
              child: new ListView (
                padding: const EdgeInsets.all( 20.0),
                children: <Widget>[

                  new DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'From Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                   
                    ),
                    
                   
                   Divider(),

                   new DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'To Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    ),


                   new Container(
                      child: new Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.lightBlueAccent.shade100,
                      elevation: 6.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 47.0,
                    onPressed: (){},
                    color: Colors.amber,
                    child: Text('Search',style:TextStyle(color:Colors.white,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    
                             ],
                      ))),
                );
              }
              }