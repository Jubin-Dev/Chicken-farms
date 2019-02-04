import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';

void main() => runApp(new Medicine());

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MedicinePage(title: 'Purchased Medicine Details'),
    );
  }
}

class MedicinePage extends StatefulWidget {
  MedicinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MedicinePageState createState() => new _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'THB', 'INR', 'AUD', 'USD'];
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
                 context, MaterialPageRoute(builder: (context) => Chicktreat())),
        

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
                   
                  Divider(

                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Medicine Name',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                        hintText: 'Medicine Type',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Medicine Company',
                      
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
                      hintText: 'please Enter Date',
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
                      hintText: 'please Enter Date',
                      labelText: 'Expiry Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                   Divider(

                  ), 
                   
                  new TextField(
                    keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Batch Number',
                       
                      ),
                    ) ,
                   
                    Divider(

                  ), 
                    new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Supplied By',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      
                        hintText: 'Quantity',
                       
                    ),
                  ),
                   Divider(
                       
                       
                     ),
                       new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Unit',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      
                        hintText: 'Unit Price',
                       
                    ),
                  ),
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
                  Divider(

                  ),   
                 
                  
                   new TextField(
                      autofocus: false,
                      keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                    hintText: 'Purchase Amount',
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 40.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       
                     ) ) 
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