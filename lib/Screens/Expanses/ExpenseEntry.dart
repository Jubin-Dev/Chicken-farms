import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';
import 'package:flutter_app/Screens/blocs/exp_bloc.dart';
import 'package:intl/intl.dart';

void main() => runApp(new ExpenseDetail());
class ExpenseDetail extends StatelessWidget {
  final String expensesdate,expensesname,vendorname,venderdetails; 
 const ExpenseDetail(
 {
    this.expensesname, this.expensesdate, this.vendorname, this.venderdetails
  }
);
  @override
  Widget build(BuildContext context) {
    return new ExpenseDetails(title: 'Expense Entry Details', );
  }
}
class ExpenseDetails extends StatefulWidget {
  ExpenseDetails({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ExpenseDetailState createState() => new _ExpenseDetailState();
}
class _ExpenseDetailState extends State<ExpenseDetails> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String expname = 'Vaccine';
  String currency = 'THB';
  final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
  };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  @override
  Widget build(BuildContext context) {
    final bloc = ExpensesBloc();
       Widget expDate(){
                return StreamBuilder<String>(
                      stream: bloc.expDateStream,
                      builder:(context, snapshot){
                          return DateTimePickerFormField(
                                inputType: inputType,
                                format: formats[inputType],
                                editable: editable,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today, color: Colors.green), 
                                      labelText: 'Expenses Date',hasFloatingPlaceholder: true
                                          ), 
                                        onChanged: (dt) => setState(()=> date = dt),
                                      );}
                                );}
        Widget expensesName(){
                return StreamBuilder<String>(
                      stream: bloc.expNameStream,
                      builder:(context, snapshot){
                        return InputDecorator(
                      decoration: InputDecoration(
                      icon: Icon(Icons.multiline_chart,color: Colors.green,),
                      labelText: 'Expense Name',
                            ),
                        child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: expname ,
                          isDense: true,                
                          onChanged: (String newValue) {
                        setState(() {
                        expname  = newValue; 
                         });
                        },
                      items: <String>['Vaccine', 'Medicines']
                     .map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(value: value,
                       child: Text(value),
                       );
                     }).toList(),
                   ),
                        ),
                        );}
                );}

      Widget vendorName(){
                return StreamBuilder<String>(
                      stream: bloc.vendorStream,
                      builder:(context, snapshot){
                        return TextField(
                            onChanged:bloc.vendorChanged,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.perm_contact_calendar,color:Colors.green),
                                labelText: 'Vendor Name',
                                  ),
                             );}
                         );}

        Widget vendorAdre(){
                return StreamBuilder<String>(
                      stream: bloc.adressStream,
                      builder:(context, snapshot){
                        return new TextField(
                          onChanged: bloc.vendorAdressChanged,
                          autofocus: false,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                            decoration: InputDecoration(
                              icon: Icon(Icons.home,color:Colors.green),
                              filled: true,
                                labelText: 'Vendor Adress/ Contact Details',
                                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 60.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    )          ) 
                            );
                           }
                   );} 

        Widget amounts(){
                return StreamBuilder<String>(
                      stream: bloc.amountStream,
                      builder:(context, snapshot){
                        return new TextField(
                            onChanged: bloc.amountChanged,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              errorText: snapshot.error,
                                icon: Icon(Icons.local_atm,color:Colors.green),
                                labelText: 'Amount',
                                  ),
                              );}
                          );}

          Widget currencyType(){
                return StreamBuilder<String>(
                      stream: bloc.amountStream,
                      builder:(context, snapshot){
                        return InputDecorator(
                          decoration: InputDecoration(
                              icon: Icon(Icons.monetization_on,color: Colors.green,),
                              labelText: 'Currency',
                                ),
                            child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                            value: currency,
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
                          ),
                          ),
                        );}
                     );}
       
       Widget remarks(){
              return StreamBuilder<String>(
                   stream: bloc.remarksStream,
                   builder:(context, snapshot){       
                   return TextField(
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit,color:Colors.green),
                            filled: true,
                            labelText: 'Remarks',
                            contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 60.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    ) ) 
                                   );}
                             );}

        Widget btn(){
              return StreamBuilder<String>(
                   stream: bloc.remarksStream,
                   builder:(context, snapshot){       
                      return RaisedButton(
                        color: Colors.amber,
                        child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                        onPressed: ()=> Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ExpTab())),
                      );}
                   );}

      return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.green[450],
            accentColor: Colors.green,
            primarySwatch: Colors.green,
              ),

      home:Scaffold(
            resizeToAvoidBottomPadding: false,
              appBar: new AppBar(
                title: new Text(widget.title),
                centerTitle: true,
                backgroundColor: Colors.amber,
                leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ExpTab())),
                         ),
                      actions: <Widget>[
                      new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
                      onPressed: () {}
                        )
                  ],
              ),
  //  
   body:new SingleChildScrollView(
                      child: new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ 
                              SizedBox(height: 2.0),
                              expDate(),
                              SizedBox(height: 10.0),
                              expensesName(),
                              SizedBox(height: 10.0),
                              vendorName(),
                              SizedBox(height: 20.0),
                              vendorAdre(),
                              SizedBox(height:10.0),
                              amounts(),
                              SizedBox(height:10.0),
                              currencyType(),
                              SizedBox(height: 10.0),
                              remarks(),
                              SizedBox(height: 20.0),
                              btn(),
                                  ]
                            )
                          )
                        ) ) );    
                    }
              }

    class ExpEntryList extends StatefulWidget{

    final String value;
    
    ExpEntryList({Key key,this.value}): super(key:key);
    
      @override
        
      _ExpEntryListPageState createState() => _ExpEntryListPageState();
         
          }
  
  class _ExpEntryListPageState extends State<ExpEntryList> {
    
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
                 context, MaterialPageRoute(builder: (context) => ExpenseDetail())),
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
                  borderRadius: BorderRadius.circular(5.0)
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
                          title: Text('Expense Entry'),
                          subtitle: Text('Details'),
                           ),

            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    new Text("Expenses Name: ${widget.value}"),
                    Divider(),
                    new Text("Expenses Date: ${widget.value}"),
                    Divider(),
                    new Text("Vendor Name: ${widget.value}"),
                    Divider(),
                    new Text("Vendor Detail: ${widget.value}"),
                    ]),

                  ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      // FlatButton(
                      //   child: Text('Save',style: TextStyle(color: Colors.teal),),
                      //   onPressed: () {/* ... */},
                      //   ),
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