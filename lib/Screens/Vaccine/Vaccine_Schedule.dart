import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';

void main() => runApp(new Vaccine());

class Vaccine extends StatelessWidget {
  final String vaccineName, animalAge;

const Vaccine(
  {
    this.vaccineName, this.animalAge
  }
);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new VaccinePage(title: 'Vaccine Schedule'),
    );
  }
}

class VaccinePage extends StatefulWidget {
  VaccinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VaccinePageState createState() => new _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  var _vaccinenameController = new TextEditingController();
  var _animalAgeController = new TextEditingController();

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
        
       ) ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            
              autovalidate: true,
              child: new ListView(
              padding: const EdgeInsets.all(45.0),
              children: <Widget>[
                  new TextField(
                    controller: _animalAgeController,
                    onChanged: (value) => _animalAgeController.text = value,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Animal Age',
                       
                    ),
                  ),

                  Divider(),
                  new TextField(
                    controller: _vaccinenameController,
                    onChanged: (value) => _vaccinenameController.text = value,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Vaccine Name',
                      
                    ),
                  ),

                  Divider(),
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
                  
                     
                  new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Remarks',
                      
                    ),
                    keyboardType: TextInputType.multiline,
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
    
    class VaccineSched extends StatefulWidget{

    final String value;
    VaccineSched({Key key,this.value}): super(key:key);
      @override
        _TreatmentlistPageState createState() => _TreatmentlistPageState();
          }
  
  class _TreatmentlistPageState extends State<VaccineSched> {
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
                 context, MaterialPageRoute(builder: (context) => Vaccine())),
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

                  new Text("Vaccine Name: ${widget.value}"),
                    Divider(),
                    new Text("AnimalAge: ${widget.value}"),
        

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