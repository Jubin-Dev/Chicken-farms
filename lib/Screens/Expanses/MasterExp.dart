import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/ExpensesTabs.dart';
import 'package:flutter_app/Screens/blocs/exp_bloc.dart';

void main() => runApp(new MasterExp());
class MasterExp extends StatelessWidget {

  MasterExp();
  @override
  Widget build(BuildContext context) {
    return new MasterExpPage(title: 'Master Expanse Details');
  }
}
class MasterExpPage extends StatefulWidget {
  MasterExpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MasterExpPageState createState() => new _MasterExpPageState();
}
class _MasterExpPageState extends State<MasterExpPage> {
  bool serviceVal = false;
  bool productVal = false; 
  @override
  Widget build(BuildContext context) {

    final bloc = ExpensesBloc();
            Widget expcode(){
                    return StreamBuilder<String>(
                      stream: bloc.expcodeStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.expcodeChanged,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorText: snapshot.error,
                          icon: Icon(Icons.space_bar,color:Colors.green),
                          labelText: 'Expense Code',
                             ),
                          );
                        }
                      );
                    }
            Widget expname(){
                    return StreamBuilder<String>(
                        stream: bloc.expnameStream,
                        builder:(context, snapshot){
                          return TextField(
                            onChanged: bloc.expnameChanged,
                              decoration: InputDecoration(
                                 errorText: snapshot.error,
                                  icon: Icon(Icons.explicit,color:Colors.green),
                                  labelText: 'Expense Name',
                                    ),
                               );}
                          );}
              
            Widget exptype(){
                   return StreamBuilder<String>(
                        stream: bloc.exptypeStream,
                        builder:(context, snapshot){
                          return TextField(
                          onChanged: bloc.exptypeChanged,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorText: snapshot.error,
                            icon: Icon(Icons.euro_symbol,color:Colors.green),
                            labelText: 'Expense Type',
                              ),
                          );}
                   );
                }
             Widget checkbox(){
                         return Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Text("Service"),
                                Checkbox(
                                value: serviceVal,
                                onChanged: (bool value) {
                                setState(() {
                                serviceVal = value;
                                  });
                                },
                            ),
                          ],
                        ),
                       
                      SizedBox(width: 50.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Product"),
                          Checkbox(
                            value: productVal,
                            onChanged: (bool value) {
                            setState(() {
                            productVal = value;
                          });
                        },
                      ),
                    ],
                   ),
               ],);
            }              
              Widget addbtn(){
                    return StreamBuilder<bool>(
                            stream: bloc.addbtn,
                            builder:(context,snapshot){
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
            home: new Scaffold(
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
        // body: new Center(
        //             child: new ListView( 
        //                   shrinkWrap: true,
        //                   padding: EdgeInsets.only(left:20.0 , right:20.0, bottom: 70.0),
        //                   children: <Widget>[
           body:new SingleChildScrollView(
                      child: new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ 
                              SizedBox(height: 2.0),
                              expcode(),
                              SizedBox(height: 10.0),
                              expname(),
                              SizedBox(height: 10.0),
                              exptype(),
                              SizedBox(height: 20.0),
                              checkbox(),
                              // SizedBox(height:10.0),
                              // product(),
                              SizedBox(height: 10.0),
                              addbtn(),
                                  ]
                            )
                          )
                     ), ), );
                    }
                   }
    class ExpList extends StatefulWidget{
    final String value;
    ExpList({Key key,this.value}): super(key:key);
    @override
    _ExpListPageState createState() => _ExpListPageState();
       }
      class _ExpListPageState extends State<ExpList> {
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
                 context, MaterialPageRoute(builder: (context) => MasterExp())),
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
                          title: Text('Expenses'),
                          subtitle: Text('Details'),
                           ),
              
            Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        new Text("Expenses Code: ${widget.value}"),
                         Divider(),
                        new Text("Expenses Name: ${widget.value}"),
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