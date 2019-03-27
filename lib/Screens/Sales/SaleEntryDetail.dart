import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';
import 'package:intl/intl.dart';

void main() => runApp(new SaleEntry());

class SaleEntry extends StatelessWidget {
  final String animalcode,animalstatus,sellingdate,buyername,adress,totalprice; 
 
 const SaleEntry(
 {
    this.animalcode, this.animalstatus, this.sellingdate, this.adress, this.buyername, this.totalprice
  }
);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
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

  var _animalcodeController = new TextEditingController();
  var _animalstatusController = new TextEditingController();
  var _sellingdateController = new TextEditingController();
  var _buyernameController = new TextEditingController();
  var _buyerAdressController = new TextEditingController();
  var _contactsController = new TextEditingController();
  var _totalpriceController = new TextEditingController();
  
 
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  // List<String> _colors = <String>['', 'Dead on Farm', 'Born On Farm', 'Purchased', 'Sold'];
  String status = 'Dead on Farm';
  String code = '101';

final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;

  @override
  Widget build(BuildContext context) {
     return new 
        Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
          title: new Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.amber,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SalesTab())),
            ),
        actions: <Widget>[
                new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
                onPressed: () {}
               )
          ],
       ),
      // body: new SafeArea(
      //     top: false,
      //     bottom: false,
      //     child: new Form(
      //         key: _formKey,
      //         autovalidate: true,
      //         child: new ListView(
      //           padding: const EdgeInsets.all(20.0),
      //           children: <Widget>[
         body:new SingleChildScrollView(
                      child: new Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                   InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Animal Code',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: code ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                       code  = newValue; 
                       });
                     },
                     items: <String>['101','102']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                   ),
                        ),
                        ),
                 InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Animal Status',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: status ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        status = newValue; 
                       });
                     },
                     items: <String>['Dead on Farm', 'Born On Farm', 'Purchased', 'Sold']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                   ),
                        ),
                        ),
                 new DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'Purchase Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    ),
                  Divider(),
                  new TextField(
                    controller: _buyernameController,
                    onChanged: (value) => _buyernameController.text = value,
                    decoration: const InputDecoration(   
                    icon: Icon(Icons.perm_contact_calendar,color:Colors.green),                  
                    labelText: 'Buyer Name',
                    ),
                  ),
                  Divider(),
                    new TextField(
                      controller: _buyerAdressController,
                      onChanged: (value) => _buyerAdressController.text = value,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                      icon: Icon(Icons.home,color:Colors.green),
                      labelText: 'Buyer Adress',
                       ),
                  ),
                   new TextField(
                     controller: _contactsController,
                     onChanged: (value) => _contactsController.text = value,
                      keyboardType: TextInputType.phone ,
                      autofocus: false,
                // initialValue: '+91-',
                      decoration: InputDecoration(
                      icon: Icon(Icons.phone_iphone,color: Colors.green,),
                      labelText: 'Mobile Number',
                      contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 20.0, 20.0),
                      )
                      ),
                    Divider(),
                    new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                    icon: Icon(Icons.local_atm,color:Colors.green),
                    labelText: 'Price',
                      // labelText: 'Symbol',
                    ),
                  ),
                  Divider(),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                    icon: Icon(Icons.local_offer,color:Colors.green),
                    labelText: 'Discount',
                      // labelText: 'Symbol',
                    ),
                  ),
                Divider(),
                new TextField(
                      controller: _totalpriceController,
                      onChanged: (value) => _totalpriceController.text = value,
                keyboardType: TextInputType.phone ,
                autofocus: false,
                // initialValue: 'Total Rs:',
                  decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on,color:Colors.green),
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0,),
                   )),
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
                    onPressed: ()=> Navigator.push(
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
    
    class SaleEntrydetail extends StatefulWidget{

    final String value;
    
    SaleEntrydetail({Key key,this.value}): super(key:key);
    
      @override
        
      _SaledetailPageState createState() => _SaledetailPageState();
         
          }
  
  class _SaledetailPageState extends State<SaleEntrydetail> {
    
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
            context, MaterialPageRoute(builder: (context) => SaleEntry())),
          ), 
     
     body:ListView.builder( itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) => Container(
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Card(
          margin: EdgeInsets.only(left: 10.0,right: 10.0),
          elevation: 10.0,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
              ),
        child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                              ListTile(
                                leading: CircleAvatar( backgroundColor: Colors.green,radius: 40.0,),
                                trailing: new IconButton(
                                  icon: Icon(Icons.delete),
                                  iconSize: 25.0,
                                    color:(isPriority)? Colors.green : Colors.redAccent,
                                    onPressed: _toggleFlag,
                                      ),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 3.0),
                          title: Text('Animal Sale Entries'),
                          subtitle: Text('Details'),
                           ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    new Text("Animal Code: ${widget.value}"),
                    Divider(),
                    new Text("Animal Status: ${widget.value}"),
                    Divider(),
                    new Text("Selling Date: ${widget.value}"),
                    Divider(),
                    new Text("Buyer Name: ${widget.value}"),
                    Divider(),
                    new Text("Buyer Adress: ${widget.value}"),
                    Divider(),
                    new Text("Total Price: ${widget.value}"),
                  ]),
            
          ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                        // FlatButton(
                        //   child: Text('Save',style: TextStyle(color: Colors.teal),),
                        //   onPressed: () {/* ... */},
                        // ),
                        FlatButton(
                          child: Text('Edit',style: TextStyle(color: Colors.teal),),
                          onPressed: () {/* ... */},
                        ),
                    ],
                  ),
                ),
             ],
           ),
        ),
       ),
    ),
     ),
      );
    }
  }