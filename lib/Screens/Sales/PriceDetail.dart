import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';

void main() => runApp(new PriceDetail());

class PriceDetail extends StatelessWidget {

  final String sirecode,breedercode,price; 
 
 const PriceDetail(
 {
    this.sirecode, this.breedercode, this.price
  }
);

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
  var _sirecodeController = new TextEditingController();
  var _priceController = new TextEditingController();
  var _breedercodeController = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _colors = <String>[' ', 'THB', 'USD', 'INR', 'AUD'];
  String currency = 'THB';
@override
  Widget build(BuildContext context) {
     return new Scaffold(
        resizeToAvoidBottomPadding: false, 
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
                       new TextField(
                          controller: _sirecodeController,
                          onChanged: (value) => _sirecodeController.text = value,
                      keyboardType: TextInputType.number ,
                      autofocus: false,
                      decoration: InputDecoration(
                      icon: Icon(Icons.space_bar,color:Colors.green),
                        filled: true,
                        labelText: 'Sire Code',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        )
                      ),
                    ),
                    Divider(),
                 new TextField(
                   controller: _breedercodeController,
                     onChanged: (value) => _breedercodeController.text = value,
                     keyboardType: TextInputType.number ,
                      decoration: InputDecoration(
                       icon: Icon(Icons.space_bar,color:Colors.green),
                        filled: true,
                        labelText: 'Breeder Code',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ) 
                    ),
                  ),
                  Divider(),
                    new TextField(
                      controller: _priceController,
                      onChanged: (value) => _priceController.text = value,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                      icon: Icon(Icons.local_atm,color:Colors.green),
                      labelText: 'Price',
                      // labelText: 'Symbol',
                    ),
                  ),

                   InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Currency',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: currency ,
                          isDense: true,                
                          onChanged: (String newValue) {
                          setState(() {
                        currency = newValue; 
                       });
                     },
                     items: <String>['THB','USD','AUD','INR']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                   ),
                        ),
                        ),
                 
                    new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    // child: Material(
                    // borderRadius: BorderRadius.circular(30.0),
                    // shadowColor: Colors.lightBlueAccent.shade100,
                    // elevation: 6.0,
                    child: RaisedButton(
                    // minWidth: 200.0,
                    // height: 47.0,
                  onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SalesTab())),
                  color: Colors.amber,
                  child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                   ) ,
                   ),
                     ),
                    ],
                      ))),
                );
                }
              }

    class PriceDetailList extends StatefulWidget{

    final String value;
    
    PriceDetailList({Key key,this.value}): super(key:key);
    
      @override
        
      _PriceDetailListPageState createState() => _PriceDetailListPageState();
         
          }
  
  class _PriceDetailListPageState extends State<PriceDetailList> {
    bool isPriority = false;
    void _toggleFlag(){
    setState(() {
     if(isPriority) {
       isPriority = false;
     }else{
       isPriority = true;
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return new  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ),
      
      home:Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => PriceDetail())),
          ), 
     body:ListView.builder( itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) => Container(
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Card(
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5)
         ),
          color: Colors.white70,
          child: Container(decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        //width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
        padding: EdgeInsets.only(right: 80.0),
        child: 
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   width: 80.0,
                //   height: 80.0,
                //   color: Colors.white70,
                //   child: CircleAvatar(
                //     // backgroundColor: Colors.green,
                    
                //     backgroundImage: NetworkImage
                //     ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
                    
                //     ),
                  
                //     ),
                SizedBox(width: 20.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text("Sire Code: ${widget.value}"),
                    Divider(),
                    new Text("Breeder Code: ${widget.value}"),
                    Divider(),
                    new Text("Price: ${widget.value}"),
                    Divider(color: Colors.teal,indent: 50.0,),
                    // new IconButton(
                    // icon: Icon(Icons.delete),
                    // iconSize: 45.0,
                    // color:(isPriority)? Colors.red : Colors.green,
                    // onPressed: _toggleFlag,
                    //  ),
                    ],
                ),
          ],
        ),
          ),
    ),
     ),
      )
      ),
      );
    }
  }