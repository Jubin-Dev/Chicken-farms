import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new SaleEntry());

class SaleEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new _SaleEntry(title: 'Sale Entry Details',),
    );
  }
}

class _SaleEntry extends StatefulWidget {
  _SaleEntry({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SalePageState createState() => new SalePageState();
}

class SalePageState extends State<_SaleEntry> {
 
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  List<String> _colors = <String>['', 'Dead on Farm', 'Born On Farm', 'Purchased', 'Sold'];
  String _color = '';

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

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
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                
                padding: const EdgeInsets.all(20.0),
                
                children: <Widget>[
                   new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Animal Code',
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
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Animal Status',
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
                  
                  new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Selling Date',
                      labelText: 'Selling Date',
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                 
                  
                  new TextFormField(
                  
                    decoration: const InputDecoration(                     
                       hintText: 'Buyer Name',
                      
                    ),
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                       hintText: 'Buyer Adress',
                       ),
                  ),
                   
                   new TextFormField(
                keyboardType: TextInputType.phone ,
                autofocus: false,
                initialValue: '+91-',
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone_iphone),
                 hintText: 'Mobile Number',
                  contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 20.0, 20.0),
                      )
                      ),


                      new TextFormField(
                        keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      // labelText: 'Symbol',
                    ),
                  ),
                  
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Discount',
                      // labelText: 'Symbol',
                    ),
                  ),
                new TextFormField(
                  
                keyboardType: TextInputType.phone ,
                autofocus: false,
                initialValue: 'Total Rs:',
                decoration: InputDecoration(filled: true,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0,),
                   )),
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