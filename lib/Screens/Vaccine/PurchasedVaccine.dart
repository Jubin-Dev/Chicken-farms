import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';
import 'package:intl/intl.dart';

void main() => runApp(new PurchVaccine());

class PurchVaccine extends StatelessWidget {
  
  final String vaccinename, vaccinetype, quantity, purchasedate, purchasedamount;
 
 const PurchVaccine(
 {
    this.vaccinename, this.vaccinetype, this.quantity, this.purchasedate, this.purchasedamount
  }
);
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

  var _vaccinenameController = new TextEditingController();
  var _vaccinetypeController = new TextEditingController();
  var _quantityController = new TextEditingController();
  var _purchasedateController = new TextEditingController();
  var _purchaseamountController = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _colors = <String>['', 'THB', 'USD', 'INR', 'AUD'];
  String currency = 'THB';
  
  

final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => VaccineTab())),
        
      ),),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.all( 20.0),
                
                children: <Widget>[

                  new TextField(
                    controller: _vaccinenameController,
                    onChanged: (value) => _vaccinenameController.text = value,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.description,color:Colors.green),
                        hintText: 'Vaccine Name',                       
                    ),
                  ),
                  Divider(
                  ), 

                  new TextField(
                    controller: _vaccinetypeController,
                    onChanged: (value) => _vaccinetypeController.text = value,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.colorize,color:Colors.green),
                      hintText: 'Vaccine Type',                      
                    ),
                  ),
                  Divider(
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.location_city,color:Colors.green),
                      hintText: 'Vaccine Company',
                      
                    ),
                  ),
                  Divider(

                  ), 
                  
                    new DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'Purchase Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                   
                    ),

                    new DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: const InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'Expiry Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                   
                    ),
                  
                  Divider(height: 30.0,),
                  
                  new TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.format_list_numbered_rtl,color:Colors.green),
                     hintText: 'Batch Number',
                     
                    ),
                    keyboardType: TextInputType.text,
                    
                  ),
                  Divider(

                  ), 
                  new TextField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.supervised_user_circle,color:Colors.green),
                        hintText: 'Supplied By',
                       
                      ),
                    ) ,
                    Divider(

                  ), 
                     
                  new TextField(
                    controller: _quantityController,
                    onChanged: (value) => _quantityController.text = value,
                     keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.widgets,color:Colors.green),
                      hintText:    'Quantity',
                      
                    ),
                    
                    ),
                    Divider(

                  ), 
                  new TextField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.format_underlined,color:Colors.green),
                        hintText: 'Unit',
                      
                      ),
                    ) ,
                    Divider(

                  ), 
                    new TextField(
                      keyboardType: TextInputType.number,
                    
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.monetization_on,color:Colors.green),
                        hintText: 'Unit Price',
                        
                      
                      ),
                    ) ,
                  InputDecorator(
                      decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
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
                  Divider(

                  ),
                    new TextField(
                    controller: _purchaseamountController,
                    onChanged: (value) => _purchaseamountController.text = value,
                    autofocus: false,
                    decoration: InputDecoration(
                    suffixIcon: Icon(Icons.local_atm,color:Colors.green),
                    filled: true,
                    hintText: 'Purchased Amount',
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ), 
                     
                     Divider(),  
                 
                    new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                    elevation: 6.0,
                    child: MaterialButton(
                    minWidth: 200.0,
                    height: 47.0,
                    onPressed: ()=> Navigator.push( 
                     context, MaterialPageRoute(builder: (context) => VaccineTab())),
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
              
    class PurchVaccineList extends StatefulWidget{

    final String value;
    
    PurchVaccineList({Key key,this.value}): super(key:key);
    
      @override
        _PurchasedVaccinePageState createState() => _PurchasedVaccinePageState();
          }
  
  class _PurchasedVaccinePageState extends State<PurchVaccineList> {
    
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
                 context, MaterialPageRoute(builder: (context) => PurchVaccine())),
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
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.white70,
                  child: CircleAvatar(
                    // backgroundColor: Colors.green,
                    
                    backgroundImage: NetworkImage
                    ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
                    
                    ),
                  
                    ),
                SizedBox(width: 20.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    new Text("Vaccine Name:${widget.value}"),
                    Divider(),
                    new Text("Vaccine Type: ${widget.value}"),
                    Divider(),
                    new Text("Quantity: ${widget.value}"),
                     Divider(),
                    new Text("Purchased Date: ${widget.value}"),
                     Divider(),
                    new Text("purchased Amount: ${widget.value}"),

                    Divider(color: Colors.teal,indent: 50.0,),
                    new IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 45.0,
                    color:(isPriority)? Colors.red : Colors.green,
                    onPressed: _toggleFlag,
                     ),

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