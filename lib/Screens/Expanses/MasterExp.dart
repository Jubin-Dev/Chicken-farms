import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';

void main() => runApp(new MasterExp());

class MasterExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MasterExpPage(title: 'Master Expanse Details'),
    );
  }
}

class MasterExpPage extends StatefulWidget {
  MasterExpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MasterExpPageState createState() => new _MasterExpPageState();
}

class _MasterExpPageState extends State<MasterExpPage> {
  bool _Switchval = true;

  
  
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,    
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ExpTab())),
        
      ),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.all( 20.0),
                children: <Widget>[
                   
                  Divider(

                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Expense Code',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                        hintText: 'Expense Name',
                       
                    ),
                  ),
                  Divider(

                  ), 
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Expense Type',
                      
                    ),
                  ),
                  Divider(

                  ), 
                  new Container(
                    children:<Widget>[ 
                      new Text('Service'),
                      Center(
                        child: Switch(
                          onChanged: (bool value){
                            setState(()=> this. _Switchval= value); 
                              
                            },
                            value: this._Switchval,
                            )
                          
                        ),
                      
                      

                       ], ),
                      
                   
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