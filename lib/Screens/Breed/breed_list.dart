import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Home_page.dart';
void main() => runApp(new Breedlist());

class Breedlist extends StatelessWidget {
  final String breedname; 
  const Breedlist(
 {
    this.breedname
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
      home: new _Breedlist(title: 'Breed Entry Details',),
    );
  }
}
class _Breedlist extends StatefulWidget {
  _Breedlist({Key key, this.title}) : super(key: key);
  final String title;
  @override
  BreedlistPageState createState() => new BreedlistPageState();
    }
  class BreedlistPageState extends State<_Breedlist> {
  var _breedController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () { Navigator.pop(context);
        }
         ),
      actions: <Widget>[
             new IconButton(icon: Icon(Icons.rotate_right,size: 35.0,),color: Colors.white,
             onPressed: () {}
            )
          ],
        ),
    //  body: new SafeArea(
    //       top: false,
    //       bottom: false,
    //       child: new Form(
    //           autovalidate: true,
    //           child: new ListView(
    //             padding: const EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
    //             children: <Widget>[
       body:new SingleChildScrollView(
                      child: new Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                 new TextField(
                  controller: _breedController,
                    onChanged: (value) => _breedController.text = value,
                    decoration: const InputDecoration( 
                    icon: Icon(Icons.pets,color:Colors.green),                    
                    labelText: 'Breed Name',
                    ),
                  ),
                    new Container(
                    child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 45.0),
                    // child: Material(
                    // borderRadius: BorderRadius.circular(30.0),
                    // shadowColor: Colors.lightBlueAccent.shade100,
                    // elevation: 6.0,
                    child: RaisedButton(
                    // minWidth: 200.0,
                    // height: 47.0,
                    onPressed: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BreedEntrydetail())),
                    color: Colors.amber,
                    child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                   ) ,
                   ),
                     ),
                    ],
                      ))),
                     );
                    }
                  }
class BreedEntrydetail extends StatefulWidget{
  final String value;
BreedEntrydetail({Key key,this.value}): super(key:key);
 @override
_BreedEntryPageState createState() => _BreedEntryPageState();
  }
class _BreedEntryPageState extends State<BreedEntrydetail> {
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
        appBar: new AppBar(
        title: new Text('Breed List'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomes())),
      ),
      ),
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Breedlist())),
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
        child: 
             Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  title: Text('Breed'),
                                  subtitle: Text('Details'),
                                  ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text("Breed Name: ${widget.value}"),
                      ]),

            ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Save',style: TextStyle(color: Colors.teal),),
                        onPressed: () {/* ... */},
                      ),
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