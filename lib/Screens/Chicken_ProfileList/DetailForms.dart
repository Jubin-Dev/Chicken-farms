import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:flutter_app/Screens/blocs/profilebloc.dart';
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

   final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
 
    String dropcodedownValue = 'Dead on Farm';
    String gender = 'Male';
    String breed = 'None';
    String weight = 'Grams';
    String currencys = 'THB';
  @override
  Widget build(BuildContext context) {
    final bloc = ProfileBloc();
        return new Container(child: Scaffold(
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
              top: true,
              bottom: true,
              child: new Container(
                    key: _formKey,
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
                      StreamBuilder<String>(
                      stream: bloc.animalCodeStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.animalCodeChanged,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    suffixIcon: Icon(Icons.code,color:Colors.green),
                    hintText: 'Animal Code',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),      
                    ),
                  ),),
                  StreamBuilder<String>(
                      stream: bloc.animalnameStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.animalNameChanged,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    suffixIcon: Icon(Icons.perm_identity,color:Colors.green),
                    hintText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),),
                  StreamBuilder<String>(
                      stream: bloc.symbolStream,
                      builder:(context, snapshot)=>
                     TextField(
                        onChanged: bloc.symbolChanged,
                        decoration:  InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.pets,color:Colors.green),
                      hintText: 'Symbol',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),),
                      StreamBuilder<String>(
                      stream: bloc.animalStatusStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                        decoration: InputDecoration(
                        errorText: snapshot.error,
                        labelText: 'Animal Status',
                        ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropcodedownValue ,
                          isDense: true,                
                          // onChanged: (String newValue) {
                          // setState(() {
                          // dropcodedownValue  = newValue; 
                          // });
                          // },
                     items: <String>['Dead on Farm', 'Born On Farm', 'Purchased', 'Sold']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(dropcodedownValue),
                       );
                       },).toList(),
                       onChanged:bloc.animalStatusChanged,
                      //  value:snapshot.data,
                        )
                        ),
                        ),
                      ),
                  StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                    DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'DOB',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    ),
                  ),
                  StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Gender',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: gender ,
                          isDense: true,                
                          // onChanged: (String newValue) {
                          // setState(() {
                          // gender  = newValue; 
                          // });
                          // },
                     items: <String>['Male','Female','Other']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                      onChanged:bloc.animalStatusChanged,
                      //  value:snapshot.data,
                   ),
                        ),
                        ),
                  ),
                  StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Breed',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: breed,
                          isDense: true,                
                    //       onChanged: (String newValue) {
                    //     setState(() {
                    //     breed  = newValue; 
                    //    });
                    //  },
                     items: <String>['None', 'Sire', 'Breeder']
                    
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                      
                     }).toList(),
                     onChanged: bloc.breedChanged,
                    //  value:snapshot.data  
                   ),
                        ),
                        ),
                  ),
                  Divider(),
                  StreamBuilder<String>(
                      stream: bloc.sireCodeStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.sireCodeChanged,
                      autofocus: false,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        suffixIcon: Icon(Icons.space_bar,color:Colors.green),
                      hintText: 'Sire Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),),
                      Divider(),
                      StreamBuilder<String>(
                      stream: bloc.breederCodeStream,
                      builder:(context, snapshot)=>
                     TextField(
                      onChanged: bloc.breederCodeChanged,
                      autofocus: false,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.space_bar,color:Colors.green),
                      hintText: 'Breeder Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),),
                     Divider(),
                      StreamBuilder<String>(
                      stream: bloc.talentsStream,
                      builder:(context, snapshot)=> 
                      TextField(
                      onChanged: bloc.talentsChanged,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.streetview,color:Colors.green),
                      hintText: 'Talents',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),                    
                       ),
                      keyboardType: TextInputType.text,                  
                      ),),
                      StreamBuilder<String>(
                      stream: bloc.weightStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.weightChanged,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.line_weight,color:Colors.green),
                      hintText: 'Weight',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                      ) ,
                    ),
                  StreamBuilder<String>(
                      stream: bloc.weightTypeStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Weight type',
                        ),
                      child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: weight ,
                          isDense: true,                
                    //       onChanged: (String newValue) {
                    //     setState(() {
                    //    weight  = newValue; 
                    //    });
                    //  },
                     items: <String>['Grams','Kilograms']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                     onChanged: bloc.weightTypeChanged,
                    //  value:snapshot.data
                   ),
                        ),
                        ),),
                    StreamBuilder<String>(
                      stream: bloc.fightingRecordStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.fightingRecordsChanged,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.format_align_right,color:Colors.green),
                      hintText:   'Fighting Records',
                      labelText:  'Fighting Records',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                    keyboardType: TextInputType.text,
                      ),
                    ),
                  StreamBuilder<String>(
                      stream: bloc.standardPriceStream,
                      builder:(context, snapshot)=>
                      TextField(
                        onChanged: bloc.standerdPriceChanged,
                        decoration:InputDecoration(
                        errorText: snapshot.error,
                        suffixIcon: Icon(Icons.attach_money,color:Colors.green),
                        labelText:  'Standerd Price',
                        hintText:   'Standerd Price',
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                    ) ,),
                      StreamBuilder<String>(
                      stream: bloc.currencyStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      // suffixIcon: Icon(Icons.space_bar,color: Colors.green,),
                      labelText: 'Currency',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: currencys ,
                          isDense: true,                
                    //       onChanged: (String newValue) {
                    //       setState(() {
                    //     currencys  = newValue; 
                    //    });
                    //  },
                     items: <String>['THB','USD','AUD','INR']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                     onChanged: bloc.currencyChanged,
                    //  value:snapshot.data,
                   ),
                        ),
                        ),),
                   StreamBuilder<String>(
                      stream: bloc.remarksStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.remarksChanged,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      suffixIcon: Icon(Icons.mode_edit,color:Colors.green),
                      hintText:   'Remarks',
                      labelText:  'Remarks',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                      keyboardType: TextInputType.multiline,
                      ), ),    
                  new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: StreamBuilder<bool>(
                    stream: bloc.submitdetails,
                    builder:(context,snapshot)=>
                    RaisedButton(
                    color: Colors.amber,
                    child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    onPressed: snapshot.hasData? null:(){
                      bloc.submit();
                    Navigator.push(context,  MaterialPageRoute(
                      builder:  (context) => Profile())
                       ); }
                         ) ), 
                        ) )],
                        ))),
                        ),);
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
     }
     else {
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
         ListView.builder(itemCount: 10,
         
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
        width: MediaQuery.of(context).size.width,
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
     