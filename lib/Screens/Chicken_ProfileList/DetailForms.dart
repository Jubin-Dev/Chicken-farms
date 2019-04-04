import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_app/Screens/Tabs/ProfilesTab.dart';
import 'package:flutter_app/Screens/blocs/profilebloc.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
  }
  class _MyHomePageState extends State<MyHomePage> {
  Future<File> imageFile;
   final formats = { InputType.date: DateFormat('dd/MM/yyyy'),
      };
  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;
  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    String dropcodedownValue = 'Dead on Farm';
    String gender = 'Male';
    String breed = 'None';
    String weight = 'Grams';
    String currencys = 'THB';
  @override
  Widget build(BuildContext context) {
      final bloc = ProfileBloc();
      pickImageFromGallery(ImageSource source) {
      setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }
    Widget logo(){
      return FutureBuilder<File>(future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
       if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
            return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               new Hero(
                tag: "imageshows" ,
                  child:CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.teal,
                      child:GestureDetector(
                        onTap: (){
                                pickImageFromGallery(ImageSource.gallery);
                                },
                        onLongPress: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ShowsImage();
                                          }));
                                        },   
                                    child:ClipOval(
                                          child:Image.file(
                                               snapshot.data,
                                                fit: BoxFit.cover,
                                                width: 90.0,
                                                height: 90.0,
                                                  ),
                                                  ),
                                                  ),
                                                 ),
                                               ),
                                              ],
                                             );
                                           }
                                    else if (snapshot.error != null) {
                                      return const Text(
                                        'Error Picking Image',
                                          textAlign: TextAlign.center,
                                          );
                                        }else {
                                          return CircleAvatar(
                                                      backgroundColor: Colors.teal,
                                                      radius: 45.0,
                                                      child:IconButton(icon:Icon(Icons.image),tooltip:'Upload Photos',iconSize: 50.0,onPressed:(){
                                                      pickImageFromGallery(ImageSource.gallery);
                                               },)
                                            );
                                          }
                                        },
                                      );
                                    }
                                          Widget animalcode(){
                                                        return StreamBuilder<String>(
                                                        stream: bloc.animalCodeStream,
                                                        builder:(context, snapshot){
                                                        return TextField(
                                                          onChanged: bloc.animalCodeChanged,
                                                            decoration: InputDecoration(
                                                                errorText: snapshot.error,
                                                                icon: Icon(Icons.code,color:Colors.green),
                                                                hintText: 'Animal Code',
                                                                labelText: 'Animal Code',
                                                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),      
                                                                ),
                                                              );}
                                                            );
                                                        }
                                          Widget animalname(){
                                                      return StreamBuilder<String>(
                                                      stream: bloc.animalnameStream,
                                                      builder:(context, snapshot){
                                                      return TextField(
                                                          onChanged: bloc.animalNameChanged,
                                                            decoration: InputDecoration(
                                                            errorText: snapshot.error,
                                                            icon: Icon(Icons.perm_identity,color:Colors.green),
                                                            labelText: 'Name',
                                                            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                            ),
                                                        );}
                                                        );
                                                      }
                                              
                                          Widget animalsymbol(){
                                                  return StreamBuilder<String>(
                                                  stream: bloc.symbolStream,
                                                  builder:(context, snapshot){
                                                       return TextField(
                                                          onChanged: bloc.symbolChanged,
                                                          decoration:  InputDecoration(
                                                          errorText: snapshot.error,
                                                          icon: Icon(Icons.pets,color:Colors.green),
                                                          labelText: 'Symbol',
                                                          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                           ),
                                                        );}
                                                        );}
                                                  
                                          Widget animalstatus(){
                                                    return StreamBuilder<String>(
                                                      stream: bloc.animalStatusStream,
                                                      builder:(context, snapshot){
                                                        return InputDecorator(
                                                          decoration: InputDecoration(
                                                          errorText: snapshot.error,
                                                          icon: Icon(Icons.query_builder,color:Colors.green),
                                                          labelText: 'Animal Status'),
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
                                                                  );}
                                                                );
                                                            }
                                                  
                                          Widget dob(){
                                              return StreamBuilder<String>(
                                                  stream: bloc.dobStream,
                                                  builder:(context, snapshot){
                                                    return DateTimePickerFormField(
                                                        inputType: inputType,
                                                        format: formats[inputType],
                                                        editable: editable,
                                                          decoration: InputDecoration(
                                                              errorText: snapshot.error,
                                                              icon:Icon(Icons.calendar_today, color: Colors.green), 
                                                              labelText: 'DOB',hasFloatingPlaceholder: true
                                                          ), 
                                                          onChanged: (dt) => setState(()=> date = dt),
                                                         );}
                                                   );} 
                                            
                                          Widget genders() { 
                                                return StreamBuilder<String>(
                                                    stream: bloc.dobStream,
                                                    builder:(context, snapshot){
                                                    return InputDecorator(
                                                      decoration: InputDecoration(
                                                        errorText: snapshot.error,
                                                        icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green,),
                                                        labelText: 'Gender',
                                                           ),
                                                        child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                            value: gender,
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
                                                    );}
                                                  );
                                                  }
                                          Widget sire(){
                                          return StreamBuilder<String>(
                                                  stream: bloc.sireCodeStream,
                                                  builder:(context, snapshot){
                                                  return TextField(
                                                      onChanged: bloc.sireCodeChanged,
                                                      autofocus: false,
                                                      keyboardType: TextInputType.number,
                                                          decoration: InputDecoration(
                                                          errorText: snapshot.error,
                                                          icon: Icon(Icons.space_bar,color:Colors.green),
                                                            labelText: 'Sire Code',
                                                            contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                                                            border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                             ) ) 
                                                            );
                                                          }
                                                      );
                                                   }
                                                  // Divider();
                                          Widget breder(){
                                                return StreamBuilder<String>(
                                                  stream: bloc.breederCodeStream,
                                                  builder:(context, snapshot){
                                                    return TextField(
                                                        onChanged: bloc.breederCodeChanged,
                                                        autofocus: false,
                                                        keyboardType: TextInputType.number,
                                                          decoration: InputDecoration(
                                                                  errorText: snapshot.error,
                                                                  icon: Icon(Icons.space_bar,color:Colors.green),
                                                                  labelText: 'Breeder Code',
                                                                  contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 15.0),
                                                                  border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                      ) ,
                                                                      ), 
                                                                  );
                                                                });
                                                              }
                                                //  Divider(),
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
                                                        stream: bloc.dobStream,
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
                                          Widget talent(){
                                             return StreamBuilder<String>(
                                                    stream: bloc.talentsStream,
                                                    builder:(context, snapshot){
                                                      return TextField(
                                                        onChanged: bloc.talentsChanged,
                                                        keyboardType: TextInputType.text, 
                                                        decoration: InputDecoration(
                                                            errorText: snapshot.error,
                                                            icon: Icon(Icons.streetview,color:Colors.green),
                                                            labelText: 'Talents',
                                                            contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),                    
                                                                     ),
                                                                );}
                                                             );
                                                        }
                                          Widget weight(){
                                          return StreamBuilder<String>(
                                              stream: bloc.weightStream,
                                              builder:(context, snapshot){
                                                  return TextField(
                                                  onChanged: bloc.weightChanged,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                  errorText: snapshot.error,
                                                  icon: Icon(Icons.line_weight,color:Colors.green),
                                                  labelText: 'Weight',
                                                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                      ),
                                                   );}
                                                  );
                                                }
                                            
                                          Widget weightType() {
                                                 return StreamBuilder<String>(
                                                  stream: bloc.weightTypeStream,
                                                  builder:(context, snapshot){
                                                  return InputDecorator(
                                                  decoration: InputDecoration(
                                                  errorText: snapshot.error,
                                                  icon: Icon(Icons.group_work,color: Colors.green,),
                                                  labelText: 'Weight type',
                                                    ),
                                                  child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    //  value: weighing,
                                                      isDense: true,                
                                                      onChanged: (String newValue) {
                                                      setState(() {
                                                    //  weighing = newValue;
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
                                                       );}
                                                    );
                                                }
                                              
                                          Widget fr(){
                                          return StreamBuilder<String>(
                                              stream: bloc.fightingRecordStream,
                                              builder:(context, snapshot){
                                                  return TextField(
                                                      onChanged: bloc.fightingRecordsChanged,
                                                      keyboardType: TextInputType.text,
                                                      decoration: InputDecoration(
                                                          errorText: snapshot.error,
                                                          icon: Icon(Icons.format_align_right,color:Colors.green),
                                                          labelText:  'Fighting Records',
                                                          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                             ),
                                                         );}
                                                       );
                                                 }
                                           
                                          Widget sp(){
                                         return StreamBuilder<String>(
                                             stream: bloc.standardPriceStream,
                                             builder:(context, snapshot){
                                                  return TextField(
                                                    onChanged: bloc.standerdPriceChanged,
                                                    keyboardType: TextInputType.number,
                                                    decoration:InputDecoration(
                                                    errorText: snapshot.error,
                                                    icon: Icon(Icons.local_offer,color:Colors.green),
                                                    labelText:  'Standerd Price',
                                                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                              ),
                                                         );}
                                                       );
                                                     }
                                                
                                          Widget currency(){
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
                                                      );}
                                                    );
                                                 }
                                          Widget remarks(){
                                              return StreamBuilder<String>(
                                                      stream: bloc.remarksStream,
                                                      builder:(context, snapshot){
                                                       return TextField(
                                                            onChanged: bloc.remarksChanged,
                                                            keyboardType: TextInputType.multiline,
                                                            maxLines: 3,
                                                            decoration: InputDecoration(
                                                              errorText: snapshot.error,
                                                              icon: Icon(Icons.mode_edit,color:Colors.green),
                                                              labelText:  'Remarks',
                                                              contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                                 ),
                                                             );}
                                                        );
                                                    }    
                                            //  final btn =
                                              // Container(
                                              //   child: new Padding(
                                              //   padding: EdgeInsets.symmetric(vertical: 40.0),
                                          Widget submit(){
                                                return StreamBuilder<bool>(
                                                  stream: bloc.submiteddetails,
                                                  builder:(context,snapshot){
                                                    return RaisedButton(
                                                      color: Colors.amber,
                                                      child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                                                      onPressed: snapshot.hasData ? null: () {
                                                      bloc.submit();
                                                      // Navigator.push(context,  MaterialPageRoute(
                                                      // builder:  (context) => Profile()) );
                                                     },
                                                     );} 
                                                     );
                                                  } 
                                     return MaterialApp(
                                      theme: ThemeData(
                                      primaryColor: Colors.green[450],
                                      accentColor: Colors.green,
                                      primarySwatch: Colors.green,
                                     ),
                                      home: new Scaffold(
                                            resizeToAvoidBottomPadding: false,
                                              appBar: new AppBar(
                                              title: new Text('Chicken Details'),
                                              centerTitle: true,
                                                backgroundColor: Colors.amber,
                                                leading: IconButton(
                                                    icon: Icon(Icons.arrow_back_ios),
                                                    onPressed: () {Navigator.pop(context);
                                                      }
                                                    ),
                                                  
                                                  actions: <Widget>[
                                                  new IconButton(icon: Icon(Icons.rotate_right),color: Colors.white,
                                                  onPressed: () {}
                                                )
                                              ],
                                              ),  
                                      body: new SingleChildScrollView(
                                        child :new Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                                                child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[ 
                                          // new Center(
                                          //             child: new ListView( 
                                          //               shrinkWrap: true,
                                          //               padding: EdgeInsets.only(left:20.0 , right:20.0),
                                          //                 children: <Widget>[
                                                          SizedBox(height: 8.0),
                                                          logo(),
                                                          SizedBox(height: 10.0),
                                                          animalcode(),
                                                          SizedBox(height: 10.0),
                                                          animalname(),
                                                          SizedBox(height: 10.0),
                                                          animalsymbol(),
                                                          SizedBox(height:10.0),
                                                          animalstatus(),
                                                          SizedBox(height: 10.0),
                                                          dob(),
                                                          SizedBox(height: 10.0),
                                                          genders(),
                                                          SizedBox(height: 10.0),
                                                          breder(),
                                                          SizedBox(height: 10.0),
                                                          sire(),
                                                          SizedBox(height: 10.0),
                                                          addBlood(),
                                                          SizedBox(height: 10.0),
                                                          talent(),
                                                          SizedBox(height: 10.0),
                                                          weight(),
                                                          SizedBox(height: 10.0),
                                                          weightType(),
                                                          SizedBox(height: 10.0),
                                                          fr(),
                                                          SizedBox(height: 10.0),
                                                          sp(),
                                                          SizedBox(height: 10.0),
                                                          currency(),
                                                          SizedBox(height: 10.0),
                                                          remarks(),
                                                          SizedBox(height: 30.0,),
                                                          submit(),
                                                        ],
                                                      ),
                                                   ),
                                                 ),
                                              ), 
                                            );
                                          }
                                        }
                            
class ShowsImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      ),
      body:Container(
        alignment: Alignment.center,
        child:Hero(
          tag: "hero",
        child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeQzwBDQV-PdXu0IzHRQcb2M0qJ7TA8Ua_6s1yHs4U09Z8hIOb"),
      )
    ));
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
    return new 
      Scaffold(
            // resizeToAvoidBottomPadding: false,
            floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.amber,
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () =>
              Navigator.push(
                 context, MaterialPageRoute(builder: (context) => MyHomePage()),
                  ),
                  ),
      body:ListView.builder(itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index) =>
           Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Card(
              margin: EdgeInsets.only(left: 10.0,right: 10.0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                      ),
        //   color: Colors.white70, 
        //   child: Container(decoration: BoxDecoration(
        //     color: Colors.transparent,
        //   ),
        // width: MediaQuery.of(context).size.width,
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
                  title: Text('Profiles'),
                  subtitle: Text('Details'),
                  ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text("Animal Code : ${widget.value}"),
                    Divider(),
                    new Text("Animal Name : ${widget.value}"),
                    Divider(),
                    new Text("Animal Status : ${widget.value}"),
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
     