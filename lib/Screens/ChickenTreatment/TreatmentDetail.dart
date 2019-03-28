import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';
import 'package:flutter_app/Screens/blocs/chic_bloc_Treatment.dart';
import 'package:intl/intl.dart';

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
    return 
    // new  MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: new ThemeData(
    //     accentColor: Colors.amber,
    //     brightness: Brightness.light,
    //   ),
      
     Scaffold(
            // resizeToAvoidBottomPadding: false,
            floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.amber,
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () { Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Treatment()));
                          }
                          ), 
      body:ListView.builder(itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index) =>
           Container(
        //width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
                margin: EdgeInsets.only(left: 10.0,right: 10.0),
                elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    ),
        //   color: Colors.white70,
        //   child: Container(decoration: BoxDecoration(
        //   color: Colors.transparent,
        //   ),
        // //width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
        // padding: EdgeInsets.only(right: 80.0),
              child: 
                  Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                              ListTile(
                                leading: CircleAvatar( backgroundColor: Colors.green,radius: 40.0,),
                                trailing: new IconButton(
                                  icon: Icon(Icons.delete),
                                  iconSize: 25.0,
                                    color:(isPriority)? Colors.green : Colors.redAccent,
                                    onPressed: _toggleFlag,
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 3.0),
                                      title: Text('Treatment'),
                                      subtitle: Text('Details'),
                                    ),
                
            Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text("Animal Code: ${widget.value}"),
                    Divider(),
                    new Text("Medicine Name: ${widget.value}"),
                    Divider(),
                    new Text("Quantity: ${widget.value}"),
                    Divider(),
                    new Text("TotalDays: ${widget.value}"),
                  ]),
                    
            ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      // FlatButton(
                      //   child: Text('Save',style: TextStyle(color: Colors.teal),),
                      //   onPressed: () {/* ... */},
                      // ),
                      FlatButton(
                        child: Text('Edit',style: TextStyle(color: Colors.teal),),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
               ],
              ),
              ),
          ),
        ),
     
    );
  }
}

class Treatment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TreatmentPageState(); 
    }
  class _TreatmentPageState extends State<Treatment>{
    final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  String code = '123';
  @override
  Widget build(BuildContext context) {
   
    final bloc = TreatmentBloc();
  
            Widget animalcode(){
                        return StreamBuilder<String>(
                          stream: bloc.anicodeStream,
                          builder:(context, snapshot){
                            return InputDecorator(
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.space_bar,color: Colors.green,),
                                labelText: 'Animal Codes',
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
                                  );} );}
                              
              Widget mediName() {
                   return StreamBuilder<String>(
                      stream: bloc.medinameStream,
                      builder:(context, snapshot){
                            return TextField(
                                onChanged: bloc.medicChanged,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    errorText: snapshot.error,
                                    icon: Icon(Icons.control_point_duplicate,color:Colors.green),
                                    labelText: 'Medicine Name',
                                        ),
                                  );} );}
                  
            Widget reason(){
                      return StreamBuilder<String>(  
                        stream: bloc.reasonStream,
                        builder:(context, snapshot){
                          return TextField(
                              onChanged: bloc.reasonChanged,
                              decoration: InputDecoration(
                                  errorText: snapshot.error,
                                  icon: Icon(Icons.help_outline,color:Colors.green),
                                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                  labelText: 'Reason',
                                        ),
                               );});}
                  
            Widget quantity(){
                      return StreamBuilder<String>(
                        stream: bloc.quantityStream,
                        builder:(context, snapshot){
                          return TextField(
                            onChanged: bloc.quantityChanged,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.widgets,color:Colors.green),
                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                labelText: 'Quantity',
                                      ),
                               );});}
                 
            Widget units(){
                    return StreamBuilder<String>(
                      stream: bloc.unitsStream,
                      builder:(context, snapshot){
                      return TextField(
                        onChanged: bloc.unitChanged,
                        keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.format_underlined,color:Colors.green),
                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                labelText: 'Units',
                                      ),
                                  );});}
                    
              Widget sd(){
                     return StreamBuilder<String>(
                          stream: bloc.startdateStream,
                          builder:(context, snapshot){
                            return DateTimePickerFormField(
                                inputType: inputType,
                                format: formats[inputType],
                                editable: editable,
                                    decoration: InputDecoration(
                                          errorText: snapshot.error,
                                          icon:Icon(Icons.calendar_today, color: Colors.green), 
                                          labelText: 'Start Date',hasFloatingPlaceholder: true
                                            ), 
                                          onChanged: (dt) => setState(()=> date = dt),
                                      );});}

                Widget ed() {
                     return StreamBuilder<String>(
                            stream: bloc.enddateStream,
                            builder:(context, snapshot){
                              return DateTimePickerFormField(
                                  inputType: inputType,
                                  format: formats[inputType],
                                  editable: editable,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error,
                                      icon: Icon(Icons.calendar_today, color: Colors.green), 
                                      labelText: 'End Date',hasFloatingPlaceholder: true
                                      ), 
                                      onChanged: (dt) => setState(()=> date = dt),
                                    );});}
                  
              Widget dose(){
                    return StreamBuilder<String>(
                          stream: bloc.dosesStream,
                          builder:(context, snapshot){
                            return TextField(
                                onChanged: bloc.dosezChanged,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    errorText: snapshot.error,
                                    icon: Icon(Icons.invert_colors,color:Colors.green),
                                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                    labelText: 'Dosage Per Day',   
                                    ),
                                    );});}
                   
                  
             Widget remark(){
                    return StreamBuilder<String>(
                        stream: bloc.remarksStream,
                        builder:(context, snapshot){
                            return TextField(
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
                                );});} 
                      
               Widget btn() {
                      return StreamBuilder<bool>(
                        stream: bloc.subtrtbtn,
                        builder:(context, snapshot){
                          return RaisedButton(
                              color: Colors.amber,
                              child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                              onPressed: snapshot.hasData ? null:() {
                                bloc.submit(); 
                                  Navigator.push (
                                    context, MaterialPageRoute(builder: (context) => Chicktreat(),
                                    ),
                                );
                              },
                   );}
                   );}
            
            return 
            MaterialApp(
                  theme: ThemeData(
                      primaryColor: Colors.green[450],
                      accentColor: Colors.green,
                      primarySwatch: Colors.green,
                       brightness: Brightness.light,
                      ),
           
             home:new Scaffold(
                    resizeToAvoidBottomPadding : false,
                    appBar: new AppBar(
                        title: new Text('Treatment'),
                        centerTitle: true,
                        backgroundColor: Colors.amber,
                        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {Navigator.pop(context);
                        }
                        ),
                          actions: <Widget>[
                                new IconButton(icon: Icon(Icons.rotate_right,),color: Colors.white,
                                onPressed: () {}
                                ),
                               ],
                              ),
            body:new SingleChildScrollView(
                  child: new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[ 
                              SizedBox(height: 10.0),
                              animalcode(),
                              SizedBox(height: 10.0),
                              mediName(),
                              SizedBox(height: 10.0),
                              reason(),
                              SizedBox(height: 10.0),
                              quantity(),
                              SizedBox(height: 10.0,),
                              units(),
                              SizedBox(height: 10.0),
                              sd(),
                              SizedBox(height: 10.0),
                              ed(),
                              SizedBox(height: 10.0),
                              dose(),
                              SizedBox(height: 10.0),
                              remark(),
                              SizedBox(height: 30.0),
                              btn(),
                            ],
                          ),
                   ),
                   )
                  ), 
                );
              }
            }


             