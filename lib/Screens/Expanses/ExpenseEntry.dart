import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';

void main() => runApp(new ExpenseDetail());

class ExpenseDetail extends StatelessWidget {

  final String expensesdate,expensesname,vendorname,venderdetails; 
 
 const ExpenseDetail(
 {
    this.expensesname, this.expensesdate, this.vendorname, this.venderdetails
  }
);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new ExpenseDetails(title: 'Expense Entry Details', ),
    );
  }
}

class ExpenseDetails extends StatefulWidget {
  ExpenseDetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ExpenseDetailState createState() => new _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetails> {

  var _expdateController = new TextEditingController();
  var _expnameController = new TextEditingController();
  var _vendornameController = new TextEditingController();
  var _vendordetailController = new TextEditingController();
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'Vaccine', 'Medicines',];
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
                 context, MaterialPageRoute(builder: (context) => ExpTab())),
        
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
                  new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                    
                    child:
                    
                    new TextField(
                      controller: _expdateController,
                     onChanged: (value) => _expdateController.text = value,
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'Expense Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                   new FormField(
                     
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Expense Name',
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
                   
                  Divider(),   
                
                  new TextField(
                      controller: _vendornameController,
                      onChanged: (value) => _vendornameController.text = value,
                    
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Vendor Name',
                       
                    ),
                  ),
                  Divider(), 
                  new TextField(
                    controller: _vendordetailController,
                     onChanged: (value) => _vendordetailController.text = value,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                    hintText: 'Vendor Adress/ Contact Details',
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 60.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                       
                     ) ) 
                     ), 
                     Divider(

                  ),
                              
                       new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Amount',
                       
                    ),
                  ),
                  Divider(

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
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                      filled: true,
                      hintText: 'Remarks',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 60.0),
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
                  onPressed: ()=> Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ExpTab())),
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

    class ExpEntryList extends StatefulWidget{

    final String value;
    
    ExpEntryList({Key key,this.value}): super(key:key);
    
      @override
        
      _ExpEntryListPageState createState() => _ExpEntryListPageState();
         
          }
  
  class _ExpEntryListPageState extends State<ExpEntryList> {
    
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
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => ExpenseDetail())),
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
                    
                    new Text("Expenses Name: ${widget.value}"),
                    Divider(),
                    new Text("Expenses Date: ${widget.value}"),
                    Divider(),
                    new Text("Vendor Name: ${widget.value}"),
                    Divider(),
                    new Text("Vendor Detail: ${widget.value}"),
                    

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