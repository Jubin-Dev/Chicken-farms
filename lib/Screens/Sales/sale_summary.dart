import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';

void main() => runApp(new SaleSummary());

class SaleSummary extends StatelessWidget {

final String animalcode,animalAge,animalType,breedercode,talents,fighting,weight,status; 
 
 const SaleSummary(
 {
    this.animalcode,this.status, this.breedercode, this.animalAge,this.fighting, this.talents, this.animalType, this.weight
  }
);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new _SaleDetail(),
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
  var _animalcodeController = new TextEditingController();
  var _animalageController = new TextEditingController();
 String dropdownValue = 'January';
 String dropYearValue = '2001';
@override
  Widget build(BuildContext context) {
    
  return new Scaffold(
          resizeToAvoidBottomPadding: false,
          // appBar: new AppBar(
          //   title: new Text(widget.title),
          //   centerTitle: true,
            
          //   backgroundColor: Colors.amber,
          //   leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () => Navigator.push(
          //            context, MaterialPageRoute(builder: (context) => SalesTab())),
            
          // ),
          // ),
          body: new SafeArea(
              top: false,
              bottom: false,
              child: new Form(
                 autovalidate: true,
                  child: new ListView(
                    padding: const EdgeInsets.all(25.0),
                    children: <Widget>[
                      InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today,color: Colors.green,),
                      labelText: 'Months',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropdownValue = newValue; 
                       });
                     },
                     items: <String>['January','February','march','April','May',
                     'June','July','August','September','October','November','December']
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
                      icon: Icon(Icons.calendar_today,color: Colors.green,),
                      labelText: 'Years',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropYearValue,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        dropYearValue = newValue; 
                       });
                     },
                     items: <String>['2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012',
                     '2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2025','2026']
                    
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
                    onPressed: (){},
                    // => Navigator.push( 
                    //                 context, MaterialPageRoute(builder: (context) => SalesTab())),
                    color: Colors.amber,
                    child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),

                   ) ,
                   ),
                     ),
                    
                    
                    ],))),
                    );
                   }
                  }
    
    class AnimalSaleList extends StatefulWidget{

    final String value;
    
    AnimalSaleList({Key key,this.value}): super(key:key);
    
      @override
        
      _AnimalSalePageState createState() => _AnimalSalePageState();
         
          }
  class _AnimalSalePageState extends State<AnimalSaleList> {
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
            onPressed: () =>  Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SaleSummary())),
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
                    new Text("AnimalCode: ${widget.value}"),
                    Divider(),
                    new Text("BreederCode: ${widget.value}"),
                    Divider(),
                    new Text("AnymalType: ${widget.value}"),
                    Divider(),
                    new Text("AnimalAge: ${widget.value}"),
                    Divider(),
                    new Text("Talents: ${widget.value}"),
                    Divider(),
                    new Text("Fight Records: ${widget.value}"),
                    Divider(),
                    new Text("Status: ${widget.value}"),
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