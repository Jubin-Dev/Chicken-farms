import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/blocs/profilebloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class FarmProfile extends StatefulWidget{
  
  static String tag ='Farm Profile';
  @override
 _FarmProfilePageState  createState() => new _FarmProfilePageState();  
  }
  class _FarmProfilePageState extends State<FarmProfile> {
  Future<File> imageFile;
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
                tag: "hero" ,
                  child:CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.teal,
                      child:GestureDetector(
                        onTap: (){
                                pickImageFromGallery(ImageSource.gallery);
                                },
                        onLongPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return NewScreen();
                                                      }));
                            
                                                    },       
                                                  child:ClipOval(
                                                    child:Image.file(
                                                        snapshot.data,
                                                        fit: BoxFit.cover,
                                                        width: 90.0,
                                                        height: 90.0,
                                                        ),),),
              ),  ),],);
                                                          }
                                                    else if (snapshot.error != null) {
                                                      return const Text(
                                                        'Error Picking Image',
                                                          textAlign: TextAlign.center,
                                                          );
                                                        }else {
                                                          return  CircleAvatar(
                                                            backgroundColor: Colors.teal,
                                                            radius: 45.0,
                                                            child:IconButton(icon:Icon(Icons.image),tooltip:'Upload Photos',iconSize: 50.0,
                                                            onPressed:(){
                                                            pickImageFromGallery(ImageSource.gallery);
                                                        },)
                                                    );
                                                  }
                                                },
                                              );
                                            }
                              Widget farmname() { 
                                return StreamBuilder<String>(
                                  stream: bloc.farmStream,
                                  builder:(context, snapshot){
                                    return TextField(
                                      keyboardType: TextInputType.text ,
                                      autofocus: false,
                                      onChanged: bloc.farmNameChanged,          
                                      decoration: InputDecoration(
                                        labelText: 'Farm Name',
                                        errorText: snapshot.error,
                                        icon: Icon(Icons.account_box, color: Colors.green),
                                        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                      ),
                                    );}
                                  );
                                }
                            
                                Widget farmAdress() {
                                  return StreamBuilder<String>(
                                      stream: bloc.farmAdressStream,
                                      builder:(context, snapshot){
                                        return TextField(
                                            keyboardType: TextInputType.multiline ,
                                            autofocus: false,
                                            onChanged: bloc.farmAdressChanged,
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                                labelText: 'Farm Adress',
                                                errorText: snapshot.error,
                                                icon: Icon(Icons.local_library, color: Colors.green),
                                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                      ),
                                    );}
                                    );
                                  }
                                  
                                Widget phone() {
                                  return StreamBuilder<String>(
                                        stream: bloc.mobileStream,
                                        builder:(context, snapshot){
                                          return TextField(
                                            keyboardType: TextInputType.phone ,
                                            autofocus: false,
                                            onChanged: bloc.mobileChanged,
                                            decoration: InputDecoration(
                                                  labelText: 'Mobile No.',
                                                  errorText: snapshot.error,
                                                  icon: Icon(Icons.phone_iphone, color: Colors.green),
                                                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                ),
                                          );} 
                                        );
                                    }
                            
                                  Widget otherphone() {
                                    return StreamBuilder<String>(
                                        stream: bloc.alternumberStream,
                                        builder:(context, snapshot){
                                          return TextField(
                                              keyboardType: TextInputType.phone ,
                                              autofocus: false,
                                              onChanged: bloc.alternumberChanged,
                                              decoration: InputDecoration(
                                                  labelText: 'Enter Alternate Mobile No.',
                                                  errorText: snapshot.error,
                                                  icon: Icon(Icons.phone_iphone, color: Colors.green),
                                                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                ),
                                          );}
                                        );
                                      }
                            
                                  Widget lineId() {
                                    return StreamBuilder<String>(
                                          stream: bloc.lineIdStream,
                                          builder:(context, snapshot){
                                            return TextField(
                                                autofocus: false,
                                                onChanged: bloc.lineIdChanged,
                                                decoration: InputDecoration(
                                                    labelText: 'Line Id',
                                                    errorText: snapshot.error,
                                                    icon: Icon(Icons.assignment_ind, color: Colors.green),
                                                    contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                              ),
                                            );}
                                          );
                                        }
                            
                                  Widget socialpage() {
                                    return StreamBuilder<String>(
                                        stream: bloc.socialPageStream,
                                        builder:(context, snapshot){
                                          return TextField(
                                            autofocus: false,
                                            keyboardType: TextInputType.url,
                                            onChanged: bloc.socialPageChanged,
                                            decoration: InputDecoration(
                                                labelText: 'Social Page',
                                                errorText: snapshot.error,
                                                icon: Icon(Icons.credit_card, color: Colors.green),
                                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                ),
                                           );}
                                         );
                                     }
                              Widget website() {
                                return StreamBuilder<String>(
                                        stream: bloc.anyWebStream,
                                        builder:(context, snapshot){
                                          return TextField(
                                            autofocus: false,
                                            keyboardType: TextInputType.url,
                                            onChanged: bloc.anyWebChanged,
                                              decoration: InputDecoration(
                                                  labelText: 'Any Website',
                                                  errorText: snapshot.error,
                                                  icon: Icon(Icons.center_focus_weak, color: Colors.green),
                                                  contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                   ),
                                                );}
                                            );
                                       }
                            
                               Widget aboutus(){
                                 return StreamBuilder<String>(
                                        stream: bloc.aboutusStream,
                                        builder:(context, snapshot){
                                        return TextField(
                                            keyboardType: TextInputType.multiline,
                                            autofocus: false,
                                            onChanged: bloc.aboutusChanged,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                                labelText: 'About Us',
                                                errorText: snapshot.error,
                                                icon: Icon(Icons.content_paste, color: Colors.green),
                                                contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                                                )
                                              );}
                                            );
                                       }
                                    Widget submitButton(){
                                //           Padding(
                                //           padding: EdgeInsets.symmetric(vertical: 50.0),
                                          return StreamBuilder<bool>(
                                              stream: bloc.submitedbutton,
                                              builder:(context, snapshot){
                                                return RaisedButton(
                                                  color: Colors.amber,
                                                  child: Text('Submit',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                                                onPressed: (){},
                                               );
                                              }
                                            );
                                           }
                            
                             
                             return new MaterialApp(
                                debugShowCheckedModeBanner: false,
                                  // title: 'Flutter Form Demo',
                                  theme: new ThemeData(
                                    primaryColor: Colors.green[450],
                                      accentColor: Colors.green,
                                      primarySwatch: Colors.green,
                                  ),
                                home: new Scaffold(
                                      body:new SingleChildScrollView(
                                            child :new Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                                                    child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: <Widget>[
                                                          SizedBox(height: 8.0),
                                                          logo(),
                                                          //  IconButton(icon: Icon(Icons.image),iconSize: 40.0,color: Colors.green,
                                                          //   onPressed:(){
                                                          //   pickImageFromGallery(ImageSource.gallery);
                                                          //    },
                                                          //    ),
                                                            
                                                          SizedBox(height: 10.0),
                                                          farmname(),
                                                          SizedBox(height: 10.0),
                                                          farmAdress(),
                                                          SizedBox(height: 10.0),
                                                          phone(),
                                                          SizedBox(height: 10.0),
                                                          otherphone(),
                                                          SizedBox(height: 10.0),
                                                          lineId(),
                                                          SizedBox(height: 10.0),
                                                          website(),
                                                          SizedBox(height: 10.0),
                                                          socialpage(),
                                                          SizedBox(height: 10.0),
                                                          aboutus(),
                                                          SizedBox(height: 25.0,),
                                                          submitButton(),
                                                        ],
                                                        ),
                                                      ),
                                                      ),
                                                       ));
                                                    }
                                                  }
                            
class NewScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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