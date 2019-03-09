import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:flutter_app/Screens/blocs/profilebloc.dart';
import 'package:intl/intl.dart';


void main() => runApp(new DetailApp());

class DetailApp extends StatelessWidget {
 
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
        
        return new Container(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
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
              child: new Form(
                    key: _formKey,
                    child: new ListView( 
                    padding: const EdgeInsets.all( 20.0),
                    children: <Widget>[
                      // final logo = 
                      Hero(tag: 'hero', 
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 45.0,
                          child: Image.asset('lib/images/photo.png'),
                        ),
                      ),
                      // final animalcode = 
                      StreamBuilder<String>(
                      stream: bloc.animalCodeStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.animalCodeChanged,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    icon: Icon(Icons.code,color:Colors.green),
                    hintText: 'Animal Code',
                    labelText: 'Animal Code',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),      
                    ),
                  ),),
                     // final animalname = 
                  StreamBuilder<String>(
                      stream: bloc.animalnameStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.animalNameChanged,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    icon: Icon(Icons.perm_identity,color:Colors.green),
                    // hintText: 'Name',
                    labelText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),),
                  // final animalsymbol = 
                  StreamBuilder<String>(
                      stream: bloc.symbolStream,
                      builder:(context, snapshot)=>
                     TextField(
                        onChanged: bloc.symbolChanged,
                        decoration:  InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.pets,color:Colors.green),
                        // hintText: 'Symbol',
                        labelText: 'Symbol',
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                  ),),
                      // final animalsatus=
                      StreamBuilder<String>(
                      stream: bloc.animalStatusStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                        decoration: InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.query_builder,color:Colors.green),
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
                     items: <String>['Dead on Farm','Born On Farm','Purchased','Sold']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                       },).toList(),
                      //  onChanged:bloc.animalStatusChanged,
                      //  value:snapshot.data,
                        )
                        ),
                        )),
                      
                  // final dob = 
                  StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                    DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                    errorText: snapshot.error,
                    icon:Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'DOB',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                    ),
                  ), 
                
                  // final genders =
                   StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green,),
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
                      // onChanged:bloc.animalStatusChanged,
                      //  value:snapshot.data,
                   ),
                        ),
                        ),
                  ),
                  // final breeder = 
                  StreamBuilder<String>(
                      stream: bloc.dobStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                      icon: Icon(Icons.beenhere,color: Colors.green,),
                      labelText: 'Breed',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                        value: breed,
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
                    //  onChanged: bloc.breedChanged,
                    //  value:snapshot.data  
                   ),
                        ),
                        ),
                  ),
                 
                  // final sire = 
                  StreamBuilder<String>(
                      stream: bloc.sireCodeStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.sireCodeChanged,
                      autofocus: false,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                      icon: Icon(Icons.space_bar,color:Colors.green),
                      // hintText: 'Sire Code',
                      labelText: 'Sire Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),),
                      
                      // final breedcode = 
                      StreamBuilder<String>(
                      stream: bloc.breederCodeStream,
                      builder:(context, snapshot)=>
                     TextField(
                      onChanged: bloc.breederCodeChanged,
                      autofocus: false,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.space_bar,color:Colors.green),
                      // hintText: 'Breeder Code',
                      labelText: 'Breeder Code',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ) ) 
                     ),),
                    //  Divider(),
                      // final talents =
                       StreamBuilder<String>(
                      stream: bloc.talentsStream,
                      builder:(context, snapshot)=> 
                      TextField(
                      onChanged: bloc.talentsChanged,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.streetview,color:Colors.green),
                      // hintText: 'Talents',
                      labelText: 'Talents',
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
                      icon: Icon(Icons.line_weight,color:Colors.green),
                      labelText: 'Weight',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                      ) ,
                    ),
                  // final wt =
                   StreamBuilder<String>(
                      stream: bloc.weightTypeStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.group_work,color: Colors.green,),
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
                    //  onChanged: bloc.weightTypeChanged,
                    //  value:snapshot.data
                   ),
                        ),
                        ),),
                    
                   
                  //  final fr = 
                   StreamBuilder<String>(
                      stream: bloc.fightingRecordStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.fightingRecordsChanged,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.format_align_right,color:Colors.green),
                      // hintText:   'Fighting Records',
                      labelText:  'Fighting Records',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    ),
                    keyboardType: TextInputType.text,
                      ),
                    ),
                //  final sp =
                  StreamBuilder<String>(
                      stream: bloc.standardPriceStream,
                      builder:(context, snapshot)=>
                      TextField(
                        onChanged: bloc.standerdPriceChanged,
                        decoration:InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.local_offer,color:Colors.green),
                        labelText:  'Standerd Price',
                        // hintText:   'Standerd Price',
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                    ) ,),
                      // final currency =
                       StreamBuilder<String>(
                      stream: bloc.currencyStream,
                      builder:(context, snapshot)=>
                      InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.monetization_on,color: Colors.green,),
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
                    //  onChanged: bloc.currencyChanged,
                    //  value:snapshot.data,
                   ),
                        ),
                        ),),
                  // final remarks = 
                  StreamBuilder<String>(
                      stream: bloc.remarksStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.remarksChanged,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.mode_edit,color:Colors.green),
                      // hintText:   'Remarks',
                      labelText:  'Remarks',
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      ),
                      keyboardType: TextInputType.multiline,
                      ), ),    
                //  final btn =
                  Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: StreamBuilder<bool>(
                    // stream: bloc.submiteddetails,
                    builder:(context,snapshot)=>
                    RaisedButton(
                    color: Colors.amber,
                    child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                    onPressed: snapshot.hasData ? null: () {
                    bloc.submit();
                    Navigator.push(context,  MaterialPageRoute(
                      builder:  (context) => Profile())
                       ); }
                         ) ), 
                        ) 
                        // ],
                        // // ))),
                        // ));
      // return Scaffold(
      //       resizeToAvoidBottomPadding: false,
      //       appBar: new AppBar(
      //       title: new Text(widget.title),
      //       centerTitle: true,
      //       leading: IconButton(
      //         icon: Icon(Icons.arrow_back_ios),
      //         onPressed: () => Navigator.push(
      //         context,MaterialPageRoute(builder: (context) => Profile(),
      //       ),
      //       ),
      //      ), 
      //       backgroundColor: Colors.amber,
      //     ),
    //   body:MaterialApp(
    //   theme: ThemeData(
    //     primaryColor: Colors.green[450],
    //     accentColor: Colors.green,
    //     primarySwatch: Colors.green,
    //     ),
    //   debugShowCheckedModeBanner: false,
    //   home: Container(
    // //  backgroundColor: Colors.white,
    //   child: Padding(
    //      padding: EdgeInsets.only(left: 25.0,right: 25.0),
    //      child: new Row(
    //      children: <Widget>[ 
    //        Flexible(
    //          flex: 1,
    //          child: new ListView(
    //           children: <Widget>[
    //        SizedBox(height: 8.0),
    //        logo,
    //        SizedBox(height: 10.0),
    //        animalcode,
    //        SizedBox(height: 10.0),
    //        animalname,
    //        SizedBox(height: 10.0),
    //        animalsymbol,
    //        SizedBox(height: 10.0),
    //        animalsatus,
    //        SizedBox(height: 10.0),
    //        dob,
    //        SizedBox(height: 10.0),
    //        genders,
    //        SizedBox(height: 10.0),
    //        breeder,
    //        SizedBox(height: 10.0),
    //        sire,
    //        SizedBox(height: 10.0,),
    //        breedcode,
    //        SizedBox(height: 10.0),
    //        talents,
    //        SizedBox(height: 10.0),
    //        wt,
    //        SizedBox(height: 10.0),
    //        fr,
    //        SizedBox(height: 10.0,),
    //        sp,
    //        SizedBox(height: 10.0),
    //        currency,
    //        SizedBox(height: 10.0,),
    //        remarks,
    //        SizedBox(height: 1.0,),
    //        btn,

    //      ],
    //    ),
    //  ),
    //      ],
                   )

                    ]) ))));
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
        resizeToAvoidBottomPadding: false,
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
                    // // backgroundColor: Colors.green,
                    
                    // backgroundImage: NetworkImage
                    // ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
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
     