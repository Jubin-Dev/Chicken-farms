import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ChickenTreatmentTabs.dart';
import 'package:flutter_app/Screens/blocs/chic_bloc_Treatment.dart';
import 'package:intl/intl.dart';

void main() => runApp(new Medicine());
class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  MedicinePage(title: 'Purchased Medicine Details');
  }
}
class MedicinePage extends StatefulWidget {
  MedicinePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MedicinePageState createState() => new _MedicinePageState();
}
class _MedicinePageState extends State<MedicinePage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<String> _colors = <String>['', 'THB', 'INR', 'AUD', 'USD'];
  String currency = 'THB';

  final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  @override
  Widget build(BuildContext context) {
    final bloc = TreatmentBloc();
            
            Widget medicname(){
                    return StreamBuilder<String>(
                      stream: bloc.medicnameStream,
                      builder:(context, snapshot){
                        return TextField(
                            onChanged: bloc.medinameChanged,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.local_pharmacy,color:Colors.green),
                                labelText: 'Medicine Name',
                          ),
                        );});
              }
                 
               Widget medicType(){
                        return StreamBuilder<String>(
                          stream: bloc.medictypeStream,
                          builder:(context, snapshot){
                            return TextField(
                                onChanged: bloc.meditypeChanged,
                                decoration:  InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.local_hospital,color:Colors.green),
                                labelText: 'Medicine Type',  
                                       ),
                                 );});}
                  
               Widget mediComp(){
                  return StreamBuilder<String>(
                      stream: bloc.mediccompStream,
                      builder:(context, snapshot){
                      return TextField(
                      onChanged:bloc.medicompanyChanged,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.location_city,color:Colors.green),
                      labelText: 'Medicine Company',
                      ),
                    );}
                  );}
                 
             Widget pd(){
                 return StreamBuilder<String>(
                      stream: bloc.pdStream,
                      builder:(context, snapshot){
                       return DateTimePickerFormField(
                          inputType: inputType,
                          format: formats[inputType],
                          editable: editable,
                            decoration: InputDecoration(
                              errorText: snapshot.error,
                              icon: Icon(Icons.calendar_today, color: Colors.green), 
                              labelText: 'Purchase Date',hasFloatingPlaceholder: true
                                      ), 
                              onChanged: (dt) => setState(()=> date = dt),
                                  );
                                 }
                              );
                          }

             Widget ed(){
                      return StreamBuilder<String>(
                      stream: bloc.edStream,
                      builder:(context, snapshot){
                         return DateTimePickerFormField(
                            inputType: inputType,
                            format: formats[inputType],
                            editable: editable,
                              decoration: InputDecoration(
                                    errorText: snapshot.error,
                                    icon: const Icon(Icons.calendar_today, color: Colors.green), 
                                    labelText: 'Expiry Date',hasFloatingPlaceholder: true
                                           ), 
                                    onChanged: (dt) => setState(()=> date = dt),
                                   );}
                            );}
                 
            Widget batchnum(){
                      return StreamBuilder<String>(
                      stream: bloc.batchStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.batchChanged,
                          keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.format_list_numbered_rtl,color:Colors.green),
                                labelText: 'Batch Number',
                                    ),
                                );}
                            );}
                
             Widget supplyby() {
                      return StreamBuilder<String>(
                      stream: bloc.supplyStream,
                      builder:(context, snapshot){
                      return TextField(
                      onChanged: bloc.suplyChanged,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                      errorText: snapshot.error,
                      icon: Icon(Icons.supervised_user_circle,color:Colors.green),
                        labelText: 'Supplied By',
                                ),
                              );
                            }
                           );
                        }
               
            Widget quantity() {
                      return StreamBuilder<String>(
                      stream: bloc.quantyStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.quantiChanged,
                          keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.widgets,color:Colors.green),
                              labelText: 'Quantity',
                                  ),
                            );}
                          );
                        }
                   
               Widget unit() {
                          return StreamBuilder<String>(
                            stream: bloc.unitStream,
                            builder:(context, snapshot){
                            return TextField(
                                onChanged: bloc.unitsChanged,
                                keyboardType: TextInputType.number,
                                decoration:  InputDecoration(
                                    errorText: snapshot.error,
                                    icon: Icon(Icons.format_underlined,color:Colors.green),
                                    labelText: 'Unit',
                                          ),
                                      );
                                    }
                                 );
                            }
                  
              Widget uniPrice(){
                        return StreamBuilder<String>(
                          stream: bloc.unipriceStream,
                          builder:(context, snapshot){
                          return TextField(
                                onChanged: bloc.upChanged,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                      errorText: snapshot.error,
                                      icon: Icon(Icons.monetization_on,color:Colors.green),
                                      labelText: 'Unit Price',
                                      ),
                                );}
                            );
                        }
               Widget currencys(){
                        return StreamBuilder<String>(
                            stream: bloc.currencyStream,
                            builder:(context, snapshot){
                            return InputDecorator(
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.monetization_on,color: Colors.green,),
                                labelText: 'Currency',
                                        ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    value: currency ,
                                    isDense: true,                
                                    onChanged: (String newValue) {
                                    setState(() {
                                  currency = newValue; 
                                });
                              },
                          items: <String>['THB','USD','AUD','INR']
                          .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(value: value,
                            child: Text(value),
                            );
                            }).toList(),
                    //  onChanged: bloc.currencyChanged,
                        ),
                        ),
                        );}
                     );
                }
                   
            Widget amount() {
                    return StreamBuilder<String>(
                      stream: bloc.amountStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.amountChanged,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              errorText: snapshot.error,
                              icon: Icon(Icons.attach_money,color:Colors.green),
                              filled: true,
                              labelText: 'Purchase Amount',
                              contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 40.0),
                                 border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                      ),
                             ) );}
                             );} 
                    
                    Widget addbtn(){
                      return StreamBuilder<bool>(
                    stream: bloc.submitdetail,
                    builder:(context, snapshot){
                      return RaisedButton(
                        color: Colors.amber,
                        child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                        onPressed:snapshot.hasData ? null:(){ 
                          Navigator.push (
                          context, MaterialPageRoute(builder: (context) => Chicktreat(),
                            ),
                         );
                      },
                   );}
                     );}
      return MaterialApp(
            theme: ThemeData(
                    primaryColor: Colors.green[450],
                    accentColor: Colors.green,
                    primarySwatch: Colors.green,
                      ),
                      
      home: new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: new AppBar(
            title: new Text(widget.title),
            centerTitle: true,
            backgroundColor: Colors.amber,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      Chicktreat())),
                  ),
            actions: <Widget>[
               new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
              onPressed: () {}
              )
            ],
          ),

      body: new SafeArea(
              top: false,
              bottom: false,
              child: new Form(
                  key: _formKey,
                  // autovalidate: true,
                  child: new ListView(
                    padding: const EdgeInsets.all( 20.0),
                    children: <Widget>[
                              SizedBox(height: 10.0),
                              medicname(),
                              SizedBox(height: 10.0),
                              medicType(),
                              SizedBox(height: 10.0),
                              mediComp(),
                              SizedBox(height: 10.0),
                              pd(),
                              SizedBox(height:10.0,),
                              ed(),
                              SizedBox(height: 10.0),
                              batchnum(),
                              SizedBox(height: 10.0),
                              supplyby(),
                              SizedBox(height: 10.0),
                              quantity(),
                              SizedBox(height: 10.0),
                              unit(),
                              SizedBox(height: 10.0),
                              uniPrice(),
                              SizedBox(height: 10.0),
                              currencys(),
                              SizedBox(height: 10.0),
                              amount(),
                              SizedBox(height: 20.0),
                              addbtn(),
                            ],
                          ),
                       ),
                      ),
                   ));
                }
              }
              

  class PurchMedicineList extends StatefulWidget{

    final String value;
    PurchMedicineList({Key key,this.value}): super(key:key);
      @override
        _PurchMediListState createState() => _PurchMediListState();
          }
  
  class _PurchMediListState extends State<PurchMedicineList> {
  @override
  Widget build(BuildContext context) {
   
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
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
        ),
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add,color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Medicine())),
           ),
          
      body: ListView.builder(itemCount: 10,
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
                    new Text("Medicine Name: ${Widget.value}"),
                    Divider(),
                    new Text("Purchased Date: ${Widget.value}"),
                    Divider(),
                    new Text("Amount: ${Widget.value}"),
                     Divider(),
                    new Text("Quantity: ${Widget.value}"),

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
      ) ,
     ) );
     }}