import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';
import 'package:flutter_app/Screens/blocs/salesbloc.dart';

void main() => runApp(new SaleDetail());

class SaleDetail extends StatelessWidget {

final String animalcode,animalAge,animalType,breedercode,talents,fighting,weight,status; 
 
 const SaleDetail(
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
      home: new _SaleDetail(title: 'Sale Details',),
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
  String breed;
  bool serviceVal = false;
@override
  Widget build(BuildContext context) {

    final bloc = SalesBloc();
  
      Widget animCode(){
                
                return StreamBuilder<String>(
                      stream: bloc.animCodeStream,
                      builder:(context, snapshot){
                          return new TextField(
                            onChanged: bloc.animCodeChanged,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.branding_watermark,color:Colors.green),
                                labelText: 'Animal Code',
                               ),
                              );}
                          );
                          }
          Widget animAge(){
                return StreamBuilder<String>(
                      stream: bloc.animAgeStream,
                      builder:(context, snapshot){      
                      return new TextField(
                      onChanged: bloc.animAgeChanged,
                       keyboardType: TextInputType.text ,
                        decoration: InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.pets,color:Colors.green),
                        labelText: 'Animal Age',
                       ),
                  );}
                 );}
        Widget animType(){
                return StreamBuilder<String>(
                      stream: bloc.animaTypeStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.animTypeChanged,
                          keyboardType: TextInputType.text ,
                          decoration: InputDecoration(
                              icon: Icon(Icons.format_list_numbered,color:Colors.green),
                              labelText: 'Type',
                                ),   
                          );}
                  );}
          Widget addBlood(){
                return ExpansionTile(
                    title: Text(
                      'Blood Percentage',
                        style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18.0,color: Colors.black45)),
                          leading: IconButton(
                          icon: Icon(Icons.backspace,color: Colors.green,),
                          onPressed: () {},
                        ),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                            SizedBox(
                            width: 150.0,
                            child:StreamBuilder<String>(
                            stream: bloc.breedTypeStream,
                            builder:(context, snapshot){
                            return InputDecorator(
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
                            );}
                            ),
                              ),
                          SizedBox(width: 50.0),
                          SizedBox(
                            width: 100.0,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Blood %',
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(4.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          ],
                          ),
                          ]
                          );}
          Widget codeSire(){
                return StreamBuilder<String>(
                      stream: bloc.codeSireStream,
                      builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.codeSireChanged,
                            keyboardType: TextInputType.number,
                            autofocus: false,
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.space_bar,color:Colors.green),
                                    filled: true,
                                    labelText: 'Sire Code',
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                  )
                                ),
                              );}
                          );}
          Widget codebreeder(){
                return StreamBuilder<String>(
                      stream: bloc.codeBreederStream,
                      builder:(context, snapshot){     
                      return TextField(
                          onChanged:bloc.codebreederChanged,
                          keyboardType: TextInputType.number ,
                           decoration: InputDecoration(
                                errorText: snapshot.error,
                                icon: Icon(Icons.space_bar,color:Colors.green),
                                filled: true,
                                labelText: 'Breeder Code',
                                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                            ) 
                        ),
                       );}
                );}
          Widget talents(){
                     return StreamBuilder<String>(
                      stream: bloc.talentsStream,
                      builder:(context, snapshot){     
                      return TextField(
                          onChanged: bloc.talentsChanged,
                          keyboardType: TextInputType.text ,
                          autofocus: false,
                          decoration: InputDecoration(
                            errorText:snapshot.error,
                            icon: Icon(Icons.streetview,color:Colors.green),
                          labelText: 'Talents',
                            ),
                        );}
                     );}
          Widget records(){
                     return StreamBuilder<String>(
                      stream: bloc.fightingStream,
                      builder:(context, snapshot){
                      return TextField(
                        onChanged: bloc.fightingChanged,
                        keyboardType: TextInputType.number ,
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.receipt,color:Colors.green),
                          labelText: 'Fighting Records',
                            ),
                          );}
                     );}
           
            Widget weight(){
                     return StreamBuilder<String>(
                        stream: bloc.weigthStream,
                        builder:(context, snapshot){
                        return TextField(
                          onChanged: bloc.weightChanged,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorText: snapshot.error,
                            icon: Icon(Icons.line_weight,color:Colors.green),
                            labelText: 'Weight',
                             ),
                        );}
                     );}
              Widget checkbox(){
                          return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                          Column(
                              children: <Widget>[
                              Text("Standard Price(Show/Hide)"),
                                Checkbox(
                                value: serviceVal,
                                onChanged: (bool value) {
                                setState(() {
                                serviceVal = value;
                                  });
                                },
                            ),
                          ],
                          )]);
                  }
            Widget price(){
                return StreamBuilder<String>(
                      stream: bloc.priceStream,
                      builder:(context, snapshot){ 
                      return TextField(
                      onChanged: bloc.priceChanged,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: snapshot.error,
                        icon: Icon(Icons.local_atm,color:Colors.green),
                        labelText: 'Price',
                          ),
                      );}
                );}

        Widget status(){
            return StreamBuilder<String>(
            stream: bloc.statusStream,
            builder:(context, snapshot){
                        return TextField(
                           onChanged: bloc.statusChanged,
                           keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                            icon: Icon(Icons.note_add,color:Colors.green),
                            labelText: 'Status',
                          ),
                         );}
                     );}

          Widget clickbtn(){
                  return StreamBuilder<bool>(
                  stream: bloc.clickbtn,
                  builder:(context, snapshot){
                        return RaisedButton(
                          color: Colors.amber,
                          child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                            onPressed: ()=> Navigator.push( 
                                      context, MaterialPageRoute(builder: (context) => SalesTab())),
                             );}
                          );}

      return new Scaffold(
            resizeToAvoidBottomPadding: false,
               appBar: new AppBar(
               title: new Text(widget.title),
                centerTitle: true,
                backgroundColor: Colors.amber,
                leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SalesTab())),
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
                            animCode(),
                            SizedBox(height: 10.0),
                            animAge(),
                            SizedBox(height: 10.0),
                            animType(),
                            SizedBox(height: 10.0),
                            addBlood(),
                            SizedBox(height:10.0),
                            codeSire(),
                            SizedBox(height: 10.0),
                            codebreeder(),
                            SizedBox(height: 10.0),
                            talents(),
                            SizedBox(height: 10.0),
                            records(),
                            SizedBox(height: 10.0),
                            weight(),
                            SizedBox(height: 8.0),
                            price(),
                            checkbox(),
                            status(),
                            SizedBox(height: 15.0),
                            clickbtn(),
                                  ]
                            )
                          )));
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
        resizeToAvoidBottomPadding:false ,
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () =>  Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SaleDetail())),
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
                          title: Text('Animal Sales'),
                          subtitle: Text('Details'),
                           ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text("AnimalCode: ${widget.value}"),
                    Divider(),
                    new Text("BreedCode: ${widget.value}"),
                    Divider(),
                    new Text("AnymalType: ${widget.value}"),
                    Divider(),
                    new Text("AnimalAge: ${widget.value}"),
                    Divider(),
                    new Text("Fight Records: ${widget.value}"),
                    Divider(),
                    new Text("Talents: ${widget.value}"),
                    Divider(),
                    new Text("Status: ${widget.value}"),
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