import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';

void main() => runApp(new Treatment());

class Treatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new TreatmentPage(title: 'Treatment Details'),
    );
  }
}

class TreatmentPage extends StatefulWidget {
  TreatmentPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TreatmentPageState createState() => new _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _codes = <String>['', '123', '111', '347', '921'];
  String _code = '';


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
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        
                        decoration: InputDecoration(
                          labelText: 'Animal Code',
                        ),
                        isEmpty: _code == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _code,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                var newContact;
                              newContact.favoriteColor = newValue;
                                _code = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _codes.map((String value) {
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
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                        hintText: 'Reason',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      hintText: 'Quantity',
                      
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      hintText: 'Units',
                      
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
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      icon: const Icon(Icons.calendar_today,color: Colors.green,),
                      hintText: 'please Enter Date',
                      labelText: 'Start Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),

                   new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      icon: const Icon(Icons.calendar_today,color: Colors.green,),
                      hintText: 'please Enter Date',
                      labelText: 'End Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                   Divider(

                  ), 
                   
                  new TextField(
                    keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                        hintText: 'Dosage Per Day',
                       
                      ),
                    ) ,
                   
                    Divider(

                  ), 
                   Divider(
                       
                       
                     ),
                  
                   new TextField(
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      filled: true,
                    hintText: 'Remark',
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 60.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       
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
                  child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    ],
                      ))),
                );
              }
              }