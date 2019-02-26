import 'package:flutter/material.dart';


void main() => runApp(new Vaccinedue());

class Vaccinedue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new VaccineduePage(title: 'Vaccine Due'),
    );
  }
}

class VaccineduePage extends StatefulWidget {
  VaccineduePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VaccineduePageState createState() => new _VaccineduePageState();
}

class _VaccineduePageState extends State<VaccineduePage> {
  
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
      // appBar: new AppBar(
      //   title: new Text(widget.title),
      //   centerTitle: true,
      //   leading: Icon(Icons.arrow_back_ios),
      //   backgroundColor: Colors.amber,
      // ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.all( 20.0),
                children: <Widget>[
                 
                  
                        new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'From Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),

                   new GestureDetector(
                    onTap: () => _selectedDate(context),
                    child: AbsorbPointer(
                      child:
                  new TextFormField(
                    decoration: const InputDecoration(
                      
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'please Enter Date',
                      labelText: 'Upto Date',
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                   ) )),
                
                         
                 
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
                     context, MaterialPageRoute(builder: (context) => VaccinedueList())),
                  color: Colors.amber,
                  child: Text('Search',style:TextStyle(color:Colors.white,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                      ),
                    ],
                      ))),
                );
              }
              }
               
    class VaccinedueList extends StatefulWidget{

    final String value;
    
    VaccinedueList({Key key,this.value}): super(key:key);
    
      @override
        
      _DuePageState createState() => _DuePageState();
         
          }
  
  class _DuePageState extends State<VaccinedueList> {
    
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
        // floatingActionButton: new FloatingActionButton(
        //     elevation: 20.0,
        //     highlightElevation: 20.0,
        //     isExtended: true,
        //     child: new Icon(Icons.add, color: Colors.white),
        //     onPressed: () => Navigator.push(
        //          context, MaterialPageRoute(builder: (context) => GiveVaccine())),
        //   ), 
     
     body:ListView.builder( itemCount: 1,
         
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
                    
                    new Text("AnimalAge: ${widget.value}"),
                    Divider(),
                    new Text("Vaccine Name:${widget.value}"),
                    Divider(),
                    new Text("Vaccine Type: ${widget.value}"),
                    Divider(),
                    new Text("Vaccine Company: ${widget.value}"),
                     Divider(),
                    new Text("Remark: ${widget.value}"),

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