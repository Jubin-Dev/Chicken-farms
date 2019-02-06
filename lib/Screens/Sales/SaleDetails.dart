import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';

void main() => runApp(new SaleDetail());

class SaleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new _SaleDetail(title: 'Sale Details',),
    );
  }
}

class _SaleDetail extends StatefulWidget {
  _SaleDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SellingPageState createState() => new SellingPageState();
}

class SellingPageState extends State<_SaleDetail> {
 bool _switchval = true;
  

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
             
              autovalidate: true,
              child: new ListView(
                
                padding: const EdgeInsets.all(25.0),
 
                children: <Widget>[
                  new TextFormField(
                     
                      keyboardType: TextInputType.text ,
                      autofocus: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        filled: true,
                        hintText: 'Animal Code',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          
                        )
                      ),
                    
                    ),
                    Divider(

                    ),
                 new TextFormField(
                     keyboardType: TextInputType.text ,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Animal Age',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                
                        ) 
                    ),
                      
                  ),
                  Divider(

                    ),
                 new TextFormField(
                     keyboardType: TextInputType.text ,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Type',
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
                      
                  ),Divider(

                  ),
                          
                       new TextFormField(
                     
                      keyboardType: TextInputType.text ,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Talents',
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
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Fighting Records',
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
                      hintText: 'Weight',
                      // labelText: 'Symbol',
                    ),
                  ),
                  Divider(

                    ),

                    new TextFormField(
                        keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Status',
                      // labelText: 'Symbol',
                    ),
                  ),
                  // new Container(
                  //   children: <Widget>[
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //       color: Colors.lightGreen,
                  //       elevation: 15.0,
                  //       child: Container(
                  //         height: 100.0,
                  //         width: 50.0,
                  //         child: Row(
                  //           children: <Widget>[
                           
                  //          new Text('Standard Price Show/Hide'),
                            
                  //           Center(child: Switch(
                  //             onChanged: (bool value){
                  //             setState(() => this._switchval = value);
                  //           },
                  //           value: this._switchval,
                  //           ),
                  //           ),
                                
                  //            ],

                  //           )
                  //         ),
               
                  // ),

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