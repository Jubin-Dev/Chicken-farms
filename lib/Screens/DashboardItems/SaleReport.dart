import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(new ReportSale());
class ReportSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
          primaryColor: Colors.green[450],
          accentColor: Colors.green,
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
 
  String dropdownValue = '100';
  String dropcodedownValue = '100';

  @override
  Widget build(BuildContext context) {
    // return new Scaffold(
     
    //   body: new SingleChildScrollView(
    //       // top: true,
    //       // bottom: true,
    //       child: new Container(
    //           // key: _formKey,
    //           // autovalidate: true,
    //       child: new Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisSize: MainAxisSize.max,
                // padding: EdgeInsets.all( 20.0),
            // children: <Widget>[
           Widget fromdate(){
                     return DateTimePickerFormField(
                      inputType: inputType,
                      format: formats[inputType],
                      editable: editable,
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today, color: Colors.green), 
                          labelText: 'From Date',hasFloatingPlaceholder: true
                            ), 
                          onChanged: (dt) => setState(()=> date = dt),
                          );
                   }
            Widget todate(){
                  return DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'To Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    );
                    }

             Widget sirecode(){
                       return InputDecorator(
                        decoration: InputDecoration(
                        icon: Icon(Icons.space_bar,color: Colors.green,),
                        labelText: 'Sire Code',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isDense: true,
                          isExpanded: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropdownValue = newValue; 
                        });
                      },
                     items: <String>['100','101','102','103','201','202','203','204','205','206']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                        ),
                        ),
                        );
                        }
             Widget breedercode(){
                       return InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Breeder Code',
                       ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                           isExpanded: true,
                           isDense: true, 
                          value: dropcodedownValue,
                          onChanged: (String newValue) {
                        setState(() {
                        dropcodedownValue  = newValue; 
                       });
                     },
                     items: <String>['100','101','102','103','1001','202','203','204','205','206','27','20','209','200','21','2012']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                       ),
                        ),
                        );
                     }
                
                // new Container(
                //     child: new Padding(
                //     padding: EdgeInsets.symmetric(vertical: 40.0),
                    // child: Material(
                    // borderRadius: BorderRadius.circular(30.0),
                    // shadowColor: Colors.lightBlueAccent.shade100,
                    // elevation: 6.0,
                   Widget search() {
                     return MaterialButton(
                          minWidth: 380.0,
                    // minWidth: 200.0,
                    // height: 47.0,
                          onPressed: (){},
                          color: Colors.amber,
                          child: Text('Search',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                       );
                     }

      return new Scaffold(
        resizeToAvoidBottomPadding: false,
         body: new SafeArea(
              top: false,
              bottom: false,
              child: new Form(
                  // key: _formKey,
                  autovalidate: true,
                  child: new ListView(
                    padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 32.0),
        // resizeToAvoidBottomPadding: false,
      // body: new SingleChildScrollView(
      //     // top: true,
      //     // bottom: true,
      //     child: new Container(
      //         // key: _formKey,
      //         // autovalidate: true,
      //     child: new Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                // padding: EdgeInsets.all( 20.0),
            children: <Widget>[
                          
                          Container(height: 10.0),
                             fromdate(),
                          Container(height: 10.0),
                              todate(),
                          Container(height: 10.0),
                              sirecode(),
                          Container(height: 10.0),
                             breedercode(),
                          Container(height: 40.0),
                              search(),
                     ]

                        ),
                      ),
                      
                      ));
                
              }
            }