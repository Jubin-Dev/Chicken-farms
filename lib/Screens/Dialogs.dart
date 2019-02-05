import 'package:flutter/material.dart';

enum DialogAction{ yes , abort}

class Dialogs{
    static Future<DialogAction>yesAbortDialog(
      
      BuildContext context, String title, String body,
       )
       
      async
      {
            final action= await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(title),
          content: TextField(
            keyboardType: TextInputType.phone ,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'OTP:',
              
            ),
          ),
          
          actions:<Widget>[

            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(DialogAction.abort),
              child: const Text('ReSend OTP'),

            ),
            RaisedButton(
              onPressed: ()=> Navigator.of(context).pop(DialogAction.yes),
              child: const Text('Verify OTP',style: TextStyle(color: Colors.white)),

            ),
          ]
                );
                
              }
            );
            return(action != null) ? action : DialogAction.abort;
            }
      }
