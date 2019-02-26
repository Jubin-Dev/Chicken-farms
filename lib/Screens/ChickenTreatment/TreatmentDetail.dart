import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';

void main() => runApp(new Treatment());

class Treatment extends StatelessWidget {
   final String animalcode, medicineName, quantity, totalDays;

const Treatment(
  {
    this.animalcode, this.medicineName, this.quantity, this.totalDays
  }
);
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
  
  var _medicinenameController = new TextEditingController();
  var _animalcodeController = new TextEditingController();
  var _quantityController = new TextEditingController();
  var _totalDaysController = new TextEditingController();
  
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
                  new TextField(
                    controller: _medicinenameController,
                    onChanged: (value) => _medicinenameController.text = value,
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
                  new TextField(
                  controller: _quantityController,
                    onChanged: (value) => _quantityController.text = value,
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
                   Divider(), 

                   
                  new TextField(
                    controller: _totalDaysController,
                    onChanged: (value) => _totalDaysController.text = value,
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
                  onPressed: ()=> Navigator.push (
                  context, MaterialPageRoute(builder: (context) => Chicktreat(),
                   ),
                   ),
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
             
   class Treatmentlist extends StatefulWidget{

    final String value;
    Treatmentlist({Key key,this.value}): super(key:key);
      @override
        _TreatmentlistPageState createState() => _TreatmentlistPageState();
          }
  
  class _TreatmentlistPageState extends State<Treatmentlist> {
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
                 context, MaterialPageRoute(builder: (context) => Treatment())),
          ), 
     body:
         ListView.builder(itemCount: 20,
         
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

                  new Text("Animal Code: ${widget.value}"),
                    Divider(),
                    new Text("Medicine Name: ${widget.value}"),
                    Divider(),
                    new Text("Quantity: ${widget.value}"),
                     Divider(),
                    new Text("TotalDays: ${widget.value}"),

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