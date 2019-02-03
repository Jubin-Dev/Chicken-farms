import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new GiveVaccine());

class GiveVaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new GiveVaccinePage(title: 'Give Vaccine'),
    );
  }
}

class GiveVaccinePage extends StatefulWidget {
  GiveVaccinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GiveVaccinePageState createState() => new _GiveVaccinePageState();
}

class _GiveVaccinePageState extends State<GiveVaccinePage> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', '123', '111', '347', '921'];
  String _color = '';
  

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
                  Divider(

                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Animal Age',
                       
                    ),
                  ),
                  Divider(

                  ), 
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
                   
                  new TextField(
                      decoration: const InputDecoration(
                        hintText: 'Vaccine Method',
                       
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