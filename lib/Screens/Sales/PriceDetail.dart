import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';

void main() => runApp(new PriceDetail());

class PriceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new _PriceDetail(title: 'Price Details',),
    );
  }
}

class _PriceDetail extends StatefulWidget {
  _PriceDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SalePageState createState() => new SalePageState();
}

class SalePageState extends State<_PriceDetail> {
 
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  List<String> _colors = <String>[' ', 'THB', 'USD', 'INR', 'AUD'];
  String _color = ' ';

@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
       
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => SalesTab())),
        
      ),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                
                padding: const EdgeInsets.all(25.0),
 
                children: <Widget>[
                          
                       new TextFormField(
                     
                      keyboardType: TextInputType.number ,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Sire Code',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          
                        )
                      ),
                    
                    ),
                    Divider(

                    ),
                 new TextFormField(
                     keyboardType: TextInputType.number ,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Breeder Code',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                
                        ) 
                    ),
                      
                  ),
                  Divider(

                    ),

                    new TextFormField(
                        keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      // labelText: 'Symbol',
                    ),
                  ),

                   new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Currency',
                        ),
                        isEmpty: _color == ' ',
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