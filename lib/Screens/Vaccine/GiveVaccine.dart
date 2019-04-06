import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/VaccineTab.dart';
import 'package:flutter_app/Screens/blocs/vaccine_bloc.dart';

void main() => runApp(new GiveVaccine());

class GiveVaccine extends StatelessWidget {
  
  final String vaccinename, vaccinetype, quantity, vaccinemethod, animalage;
 
 const GiveVaccine(
 {
    this.vaccinename, this.vaccinetype, this.quantity, this.vaccinemethod, this.animalage
  }
);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: 'Flutter Form Demo',
        theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new GiveVaccinePage(title: 'Give Vaccine'),
    );
  }
}

class GiveVaccinePage extends StatefulWidget {
  GiveVaccinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GiveVaccinePageState createState() => new _GiveVaccinePageState();
}

class _GiveVaccinePageState extends State<GiveVaccinePage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _colors = <String>['', '123', '111', '347', '921'];
  String code = '123';
  

  @override
  Widget build(BuildContext context) {
    final bloc = VaccineBloc();
   
          Widget animalCode(){
                return StreamBuilder<String>(
                  stream: bloc.aniCodeStream,
                  builder:(context,snapshot){         
                  return new
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
                          setState((){
                          code  = newValue; 
                        });
                      },
                     items: <String>['123', '111', '347', '921']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                        );
                      }).toList(),
                      ),
                     ),
                      );}
                  );}
                  
            Widget animalAge(){
                  return StreamBuilder<String>(
                      stream: bloc.animalAgeStream,
                      builder:(context,snapshot){
                      return
                        new TextField(
                            onChanged:bloc.ageAnimalsChanged, 
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                            icon: Icon(Icons.content_paste,color:Colors.green),
                            labelText: 'Animal Age',
                          ),
                        );}
                    );}
            Widget vaccineName(){
                  return StreamBuilder<String>(
                      stream: bloc.vaccinesNamesStream,
                      builder:(context,snapshot){
                      return new TextField(
                        onChanged:bloc.nameVaccinesChanged,
                        decoration: InputDecoration(
                          errorText: snapshot.error,
                        icon: Icon(Icons.description,color:Colors.green),
                        labelText: 'Vaccine Name',
                          ),
                     );}
                  );}
             Widget vaccineType(){
                  return StreamBuilder<String>(
                      stream: bloc.vaccinesTypeStream,
                      builder:(context,snapshot){      
                      return new TextField(
                      onChanged: bloc.vaccineTypeChanged,
                      decoration: const InputDecoration(
                      icon: Icon(Icons.colorize,color:Colors.green),
                      labelText: 'Vaccine Type',
                        ),
                      );}
                  );}
            Widget vaccineCompany(){
                  return StreamBuilder<String>(
                      stream: bloc.companyVaccineStream,
                      builder:(context,snapshot){     
                      return new TextField(
                    onChanged: bloc.vaccineCompanyChanged,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.location_city,color:Colors.green),
                      labelText: 'Vaccine Company',
                        ),
                      );}
                  );}
            Widget vaccineMethod(){
                  return StreamBuilder<String>(
                      stream: bloc.vaccineCompanyStream,
                      builder:(context,snapshot){  
                        return new TextField(
                      onChanged: bloc.methodVaccineChanged,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.local_pharmacy,color:Colors.green),
                        labelText: 'Vaccine Method',
                      ),
                    );}
                  );}
            Widget quantity(){
                  return StreamBuilder<String>(
                      stream: bloc.quantityyStream,
                      builder:(context,snapshot){        
                      return new TextField(
                     onChanged: bloc.quantityVaccineChanged,
                     keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                    icon: Icon(Icons.widgets,color:Colors.green),
                    labelText: 'Quantity',
                       ),
                    );}
                  );}
            Widget remarks(){
                  return StreamBuilder<String>(
                      stream: bloc.remarksStream,
                      builder:(context,snapshot){ 
                      return 
                      new TextField(
                        onChanged: bloc.remarksChanged,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                          icon: Icon(Icons.edit,color:Colors.green),
                          filled: true,
                          labelText: 'Remark',
                          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 60.0),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          ) ) 
                      );}
                  );}
          Widget button(){
                  return StreamBuilder<bool>(
                  stream: bloc.addingDetails,
                  builder:(context, snapshot){
                    return new RaisedButton(
                    color: Colors.amber,
                      child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                      onPressed: () => Navigator.push( 
                      context, MaterialPageRoute(builder: (context) => VaccineTab())),
                      );}
                   );}
    return new 
        Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => VaccineTab())),
          ),
      actions: <Widget>[
              new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
              onPressed: () {}
              )
            ],
      ),
      body:new SingleChildScrollView(
                    child: new Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       SizedBox(height: 2.0),
                            animalCode(),
                            SizedBox(height: 10.0),
                            animalAge(),
                            SizedBox(height: 10.0),
                            vaccineName(),
                            SizedBox(height: 10.0),
                            vaccineType(),
                            SizedBox(height:10.0),
                            vaccineCompany(),
                            SizedBox(height: 10.0),
                            vaccineMethod(),
                            SizedBox(height: 10.0),
                            quantity(),
                            SizedBox(height:10.0),
                            remarks(),
                            SizedBox(height: 30.0),
                            button(),
                          ]
                      ))),
                  );
                }
              }
              
    class GivenVaccineList extends StatefulWidget{

    final String value;
    
    GivenVaccineList({Key key,this.value}): super(key:key);
    
      @override
        
      _GivenVaccinePageState createState() => _GivenVaccinePageState();
         
          }
  
  class _GivenVaccinePageState extends State<GivenVaccineList> {
    
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
                 context, MaterialPageRoute(builder: (context) => GiveVaccine())),
          ), 
     
     body:ListView.builder( itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) =>
          Container(
        //width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              margin: EdgeInsets.only(left: 10.0,right: 10.0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.5)
                    ),
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
                          title: Text('Giving Vaccine'),
                          subtitle: Text('Details'),
                           ),
              
            Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    new Text("AnimalAge: ${widget.value}"),
                    Divider(),
                    new Text("Vaccine Name:${widget.value}"),
                    Divider(),
                    new Text("Vaccine Type: ${widget.value}"),
                    Divider(),
                    new Text("Quantity: ${widget.value}"),
                     Divider(),
                    new Text("Vaccine Method: ${widget.value}"),
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
      ),
      );
    }
  }