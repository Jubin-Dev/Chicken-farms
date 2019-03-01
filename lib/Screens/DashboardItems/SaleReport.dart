import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Home_page.dart';
import 'package:intl/intl.dart';


void main() => runApp(new ReportSale());

class ReportSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new ReportSalePage(title: 'Sales Report'),
    );
  }
}

class ReportSalePage extends StatefulWidget {
  ReportSalePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ReportSalePageState createState() => new _ReportSalePageState();
}
class _ReportSalePageState extends State<ReportSalePage> {

  final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;

  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _colors = <String>['', '100', '101', '102', '103'];
  String dropdownValue = '100';
  String dropcodedownValue = '100';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(widget.title),
      //   centerTitle: true,
        
      //   backgroundColor: Colors.amber,
      //   leading: IconButton(icon: Icon(Icons.arrow_back_ios),
      //   onPressed: () => Navigator.push(
      //            context, MaterialPageRoute(builder: (context) => MyHomes())),
        
      // ),
      // ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              // key: _formKey,
              autovalidate: true,
              child: new ListView(
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
                  
                   Divider(),
                     InputDecorator(
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Sire Code',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropdownValue = newValue; 
                       });
                     },
                     items: <String>['100', '101', '102', '103']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                   ),
                        ),
                        ),
                  Divider(),
                   
                     InputDecorator(
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Breeder Code',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropcodedownValue ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropcodedownValue  = newValue; 
                       });
                     },
                     items: <String>['100', '101', '102', '103']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                   ),
                        ),
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