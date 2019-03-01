import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:intl/intl.dart';

void main() => runApp(new DetailApp());

class DetailApp extends StatelessWidget {
 
  final String animalcode, animalname, animalstatus, age, breed, imgeurl;

const DetailApp (
  {
    this.animalcode, this.animalname, this.animalstatus, this.age, this.breed, this.imgeurl,
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
      home: new MyHomePage(title: 'Chicken Details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _animalnameController = new TextEditingController();
  var _animalcodeController = new TextEditingController();
  var _animalstatusController = new TextEditingController();
  // var _animalageController = new TextEditingController();
  // var _animalbreedController = new TextEditingController();
  // var _animalimageurlController = new TextEditingController();

   final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    
    // List<String> _colors = <String>['', 'Dead on Farm', 'Born On Farm', 'Purchased', 'Sold'];
    // List<String> _genders = <String>['', 'Male', 'Female', 'Other'];
    // List<String> _breeds = <String>['', 'None', 'Sire', 'Breeder'];
    // List<String> _weights = <String>['', 'Grams','Kilograms'];
    // List<String> _currency = <String>['', 'THB','USD','AUD','INR'];
 
    String dropcodedownValue = 'Dead on Farm';
    String gender = 'Male';
    String breed = 'None';
    String weight = 'Grams';
    String currencys = 'THB';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
          context,MaterialPageRoute(builder: (context) => Profile(),
       ),
        ),
       ),
        
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
                  Hero(tag: 'hero', 
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 45.0,
                      child: Image.asset('lib/images/photo.png'),
                    ),
                  ),
                  new TextField(
                    controller: _animalcodeController,
                    onChanged: (value) => _animalcodeController.text = value,
                    decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.code,color:Colors.green),
                    hintText: 'Animal Code',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),     
                    ),
                  ),
                  new TextField(
                    controller: _animalnameController,
                    onChanged: (value) => _animalnameController.text = value,
                    decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.perm_identity,color:Colors.green),
                      hintText: 'Name',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),
                  new TextField(
                      decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.pets,color:Colors.green),
                      hintText: 'Symbol',
                     contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),

                InputDecorator(
                      decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Animal Status',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropcodedownValue ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropcodedownValue  = newValue; 
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
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'DOB',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    ),
                  
                  InputDecorator(
                      decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Gender',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: gender ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        gender  = newValue; 
                       });
                     },
                     items: <String>['Male','Female','Other']
                    
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
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Breed',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: breed ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        breed  = newValue; 
                       });
                     },
                     items: <String>['None', 'Sire', 'Breeder']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                   ),
                        ),
                        ),
                   
                  Divider(),
                  new TextField(
                      controller: _animalstatusController,
                      onChanged: (value) => _animalstatusController.text = value,
                      autofocus: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.space_bar,color:Colors.green),
                      hintText: 'Sire Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),
                      Divider(),

                     new TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                      suffixIcon: Icon(Icons.space_bar,color:Colors.green),
                      hintText: 'Breeder Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),
                     Divider(),
                  new TextFormField(
                      decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.streetview,color:Colors.green),
                      hintText: 'Talents',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),                    
                    ),
                    keyboardType: TextInputType.text,                  
                    ),
                  new TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.line_weight,color:Colors.green),
                        hintText: 'Weight',
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                    ) ,
                  InputDecorator(
                      decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Weight type',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: weight ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                       weight  = newValue; 
                       });
                     },
                     items: <String>['Grams','Kilograms']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                   ),
                        ),
                        ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.format_align_right,color:Colors.green),
                      hintText:   'Fighting Records',
                      labelText:  'Fighting Records',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                    keyboardType: TextInputType.text,
                    
                  ),
                  new TextField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.attach_money,color:Colors.green),
                        labelText:  'Standerd Price',
                        hintText:   'Standerd Price',
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                    ) ,
                  InputDecorator(
                      decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Currency',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: currencys ,
                          isDense: true,                
                          onChanged: (String newValue) {
                          setState(() {
                        currencys  = newValue; 
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
                  new TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.mode_edit,color:Colors.green),
                      hintText:   'Remarks',
                      labelText:  'Remarks',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),     
                  new Container(
                    child: new Padding(
                     padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                   elevation: 7.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                    color: Colors.amber,
                  child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                  height: 47.0,
                  onPressed: (){

                    Navigator.push(context,  MaterialPageRoute(
                      
                      builder:  (context) => Profile())
                       ); }
                     
                    
                   ) ),
                      // route = new {
                      //   var chickenProfile = ChickenProfile(
                      //   value: DetailApp(
                      //     animalname: _animalnameController.text,
                      //     animalcode: _animalcodeController.text,
                      //     animalstatus: _animalstatusController.text,
                      //     imgeurl: _animalimageurlController.text,
                      //   ),
                      // );
                        // return chickenProfile;
                    
                    // var route = new MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     var chickenProfile = ChickenProfile(
                    //     value: DetailApp(
                    //       animalname: _animalnameController.text,
                    //       animalcode: _animalcodeController.text,
                    //       animalstatus: _animalstatusController.text,
                    //       imgeurl: _animalimageurlController.text,
                    //     ),
                    //   );
                    //     return chickenProfile;
                    //   },
                  //  );
                   // Navigator.of(context).push(route);
              //     },
              //     color: Colors.amber,
              //     child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
              //      ) ,
              //      ),
              //        ),
              //         ),
                     ) )],
                      ))),
                );
              }
              }

    class NextPage extends StatefulWidget{

    final String value;
    
    NextPage({Key key,this.value}): super(key:key);
      @override
        _NextPageState createState() => _NextPageState();
          
          }
  
  class _NextPageState extends State<NextPage> {
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
                 context, MaterialPageRoute(builder: (context) => DetailApp()),
                 ),
          ), 
     body:
         ListView.builder(itemCount: 30,
         
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

                  //  SizedBox(width: 100.0,child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: <Widget>[
                  //     IconButton(icon: Icon(Icons.delete,),onPressed: (){},)
                  //   ],) )
                //  SizedBox(width:100.0,child: Row( children<Widget>[  new IconButton(
                //     icon: Icon(Icons.delete),
                //     color:(isPriority)? Colors.red : Colors.green,
                //     onPressed: _toggleFlag,
                //     ) ]) ),

                  
                    new Text("Animal Code : ${widget.value}"),
                    Divider(),
                    new Text("Animal Name : ${widget.value}"),
                    Divider(),
                    new Text("Animal Status : ${widget.value}"),
                
                   Divider(color: Colors.teal,indent: 50.0,),
                    new IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 45.0,
                    color:(isPriority)? Colors.red : Colors.green,
                    onPressed: _toggleFlag,
                     ),

                    ],
                 
                ),
                //SizedBox(width: 25.0,child: //Row(mainAxisAlignment: MainAxisAlignment.end,
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: <Widget>[
                      // Container(color: Colors.red,width: 50,)
                      //IconButton(icon: Icon(Icons.delete,),onPressed: (){},),
                   // ) ,
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
      //  Future DetailApp() async{

      //    ChickenProfile chicken = await Navigator.of(context).push(
      //      MaterialPageRoute(
      //        builder: (BuildContext context){
      //          return ChickenProfile();
      //        },
      //      ),
        //  );
        //  if( chicken != null){
        // initialChickens.add(chicken);

        //  }

       
      //  }