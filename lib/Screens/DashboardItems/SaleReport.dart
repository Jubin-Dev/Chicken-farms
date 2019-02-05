import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Home_page.dart';


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

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', '100', '101', '102', '103'];
  String _color = '';

  
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
              key: _formKey,
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
                    new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Sire Code',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                              newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),


                   new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Breeder Code',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                              newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
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