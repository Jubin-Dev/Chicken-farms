import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/Tabs/SalesTab.dart';
import 'package:flutter_app/Screens/blocs/salesbloc.dart';
void main() => runApp(new PriceDetail());
class PriceDetail extends StatelessWidget {
  final String sirecode,breedercode,price; 
 const PriceDetail(
 {
    this.sirecode, this.breedercode, this.price
  }
);
  @override
  Widget build(BuildContext context) {
    return new _PriceDetail(title: 'Price Details',);
  }
}
class _PriceDetail extends StatefulWidget {
  _PriceDetail({Key key, this.title}) : super(key: key);
  final String title;
  @override
  SalePageState createState() => new SalePageState();
}
class SalePageState extends State<_PriceDetail> {
final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String currency = 'THB';
@override
  Widget build(BuildContext context) {
      
      final bloc = SalesBloc();
       
       Widget sireCode(){
                return StreamBuilder<String>(
                      stream: bloc.sirecodeStream,
                      builder:(context, snapshot){
                       return new TextField(
                        onChanged:bloc.sirecodeChanged,
                        keyboardType: TextInputType.number ,
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
        Widget breederCode(){
              return StreamBuilder<String>(
                      stream: bloc.breedercodeStream,
                      builder:(context, snapshot){       
                        return TextField(
                          onChanged:bloc.breedercodeChanged,
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
         Widget currencyType(){
              return StreamBuilder<String>(
                      stream: bloc.currencytypeStream,
                      builder:(context, snapshot){ 
                        return InputDecorator(
                          decoration: InputDecoration(
                              icon: Icon(Icons.space_bar,color: Colors.green,),
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
                            ),
                          ),
                          );}
                        );}
                 
        Widget subbtn(){
              return StreamBuilder<bool>(
                      stream: bloc.addbtn,
                      builder:(context, snapshot){ 
                      return RaisedButton(
                        color: Colors.amber,
                        child: Text('Add',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                        onPressed: () => Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SalesTab())),
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
                        context, MaterialPageRoute(builder: (context) => SalesTab())),
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
              autovalidate: true,
              child: new ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left:20.0 , right:20.0,top: 30.0),
                children: <Widget>[      
                              SizedBox(height: 2.0),
                              sireCode(),
                              SizedBox(height: 10.0),
                              breederCode(),
                              SizedBox(height: 10.0),
                              price(),
                              SizedBox(height: 20.0),
                              currencyType(),
                              SizedBox(height:10.0),
                              subbtn(),
                              ]
                            )
                          )
                  ) ) );  
             }
          }

    class PriceDetailList extends StatefulWidget{
    final String value;
    PriceDetailList({Key key,this.value}): super(key:key);
      @override
      _PriceDetailListPageState createState() => _PriceDetailListPageState();
          }
    class _PriceDetailListPageState extends State<PriceDetailList> {
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
                 context, MaterialPageRoute(builder: (context) => PriceDetail())),
          ), 
     body:ListView.builder( itemCount: 20,
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
                // Container(
                //   width: 80.0,
                //   height: 80.0,
                //   color: Colors.white70,
                //   child: CircleAvatar(
                //     // backgroundColor: Colors.green,
                    
                //     backgroundImage: NetworkImage
                //     ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
                    
                //     ),
                  
                //     ),
                SizedBox(width: 20.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text("Sire Code: ${widget.value}"),
                    Divider(),
                    new Text("Breeder Code: ${widget.value}"),
                    Divider(),
                    new Text("Price: ${widget.value}"),
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