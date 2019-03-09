import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';
import 'package:flutter_app/Screens/blocs/chic_bloc_Treatment.dart';
import 'package:intl/intl.dart';

void main() => runApp(new Treatment());

class Treatment extends StatelessWidget {
  //  final String animalcode, medicineName, quantity, totalDays;

// const Treatment(
//   {
//     this.animalcode, this.medicineName, this.quantity, this.totalDays
//   }
// );
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
  
  final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _codes = <String>['', '123', '111', '347', '921'];
  String code = '123';

  @override
  Widget build(BuildContext context) {
    final bloc = TreatmentBloc();
        return new 
           Scaffold(
          resizeToAvoidBottomPadding: false,
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
                      StreamBuilder<String>(
                      stream: bloc.anicodeStream,
                      builder:(context, snapshot)=>
                  InputDecorator(
                      decoration: InputDecoration(
                      errorText: snapshot.error,
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
                     items: <String>['123', '111', '347', '921']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                    //  onChanged: bloc.anicodeChanged,
                    //  value:snapshot.data,
                       ),
                        ),
                       ), ),
                  Divider(),
                  StreamBuilder<String>(
                      stream: bloc.medinameStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.medicChanged,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.control_point_duplicate,color:Colors.green),
                       labelText: 'Medicine Name',
                       
                    ),
                   ), ),
                  Divider(), 
                  StreamBuilder<String>(
                      stream: bloc.reasonStream,
                      builder:(context, snapshot)=>
                    TextField(
                      onChanged: bloc.reasonChanged,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.help_outline,color:Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      labelText: 'Reason',
                       
                    ),
                  ),),
                  Divider(), 
                  StreamBuilder<String>(
                      stream: bloc.quantityStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.quantityChanged,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.widgets,color:Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      labelText: 'Quantity',
                      
                    ),
                  ),),
                  Divider(), 
                  StreamBuilder<String>(
                      stream: bloc.unitsStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.unitChanged,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.format_underlined,color:Colors.green),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      labelText: 'Units',
                      
                    ),
                  ),),
                   Divider(),
                    StreamBuilder<String>(
                      stream: bloc.startdateStream,
                      builder:(context, snapshot)=>
                    DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon:Icon(Icons.calendar_today, color: Colors.green), 
                      labelText: 'Start Date',hasFloatingPlaceholder: true
                       ), 
                    onChanged: (dt) => setState(()=> date = dt),
                   
                    ),),

                    StreamBuilder<String>(
                      stream: bloc.enddateStream,
                      builder:(context, snapshot)=>
                    DateTimePickerFormField(
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                    icon: Icon(Icons.calendar_today, color: Colors.green), 
                    labelText: 'End Date',hasFloatingPlaceholder: true
                    ), 
                    onChanged: (dt) => setState(()=> date = dt),
                   
                    ),),
                   Divider(),
                  StreamBuilder<String>(
                      stream: bloc.dosesStream,
                      builder:(context, snapshot)=>
                    TextField(
                    onChanged: bloc.dosezChanged,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.invert_colors,color:Colors.green),
                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                        labelText: 'Dosage Per Day',   
                      ),
                    ),),
                   
                    Divider(), 
                    Divider(),
                   StreamBuilder<String>(
                      stream: bloc.remarksStream,
                      builder:(context, snapshot)=>
                      TextField(
                      onChanged: bloc.remarksChanged,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.edit,color:Colors.green),
                      filled: true,
                      labelText: 'Remark',
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 60.0),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                     ) ) 
                     ),), 
                    Divider(),  
                    new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: StreamBuilder<bool>(
                      // stream: bloc.subtrtbtn,
                      builder:(context, snapshot)=>
                      RaisedButton(
                        color: Colors.amber,
                        child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                  // minWidth: 200.0,
                  // height: 47.0,
                    onPressed: snapshot.hasData ? null:(){
                      bloc.submit(); Navigator.push (
                    context, MaterialPageRoute(builder: (context) => Chicktreat(),
                    ),
                    );
                    },
                   ),
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
        resizeToAvoidBottomPadding: false,
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Treatment())),
          ), 
      
      body:ListView.builder(itemCount: 20,
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
                    // backgroundImage: NetworkImage
                    // ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
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