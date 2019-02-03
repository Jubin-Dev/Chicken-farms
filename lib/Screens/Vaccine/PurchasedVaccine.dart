import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new PurchVaccine());

class PurchVaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new PurchVaccinePage(title: 'Purchased Vaccine'),
    );
  }
}

class PurchVaccinePage extends StatefulWidget {
  PurchVaccinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PurchVaccinePageState createState() => new _PurchVaccinePageState();
}

class _PurchVaccinePageState extends State<PurchVaccinePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'THB', 'USD', 'INR', 'AUD'];
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
                padding: const EdgeInsets.all( 20.0),
                children: <Widget>[
                  new TextFormField(
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
                  
                        new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date of Purchase',
                      labelText: 'Purchase Date',
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
                      hintText: 'please Enter Date of Expired',
                      labelText: 'Expiry Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                
                          Divider(
                       
                       height: 30.0,
                     ),
                  new TextFormField(
                    decoration: const InputDecoration(
                     hintText: 'Batch Number',
                     
                    ),
                    keyboardType: TextInputType.text,
                    
                  ),
                  Divider(

                  ), 
                  new TextField(
                      decoration: const InputDecoration(
                        hintText: 'Supplied By',
                       
                      ),
                    ) ,
                    Divider(

                  ), 
                     
                  new TextFormField(
                     keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText:    'Quantity',
                      
                    ),
                    
                    ),
                    Divider(

                  ), 
                  new TextField(
                      decoration: const InputDecoration(
                        hintText: 'Unit',
                      
                      ),
                    ) ,
                    Divider(

                  ), 
                    new TextField(
                      keyboardType: TextInputType.number,
                    
                      decoration: const InputDecoration(
                        
                        hintText: 'Unit Price',
                        
                      
                      ),
                    ) ,
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Currency',
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
                  Divider(

                  ),
                   new TextField(
                      autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                    hintText: 'Purchased Amount',
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ), 
                     Divider(

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