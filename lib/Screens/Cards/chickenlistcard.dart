// // This sample shows creation of a [Card] widget that shows album information
// // and two actions.

// import 'package:flutter/material.dart';

// void main() => runApp(Cards());

// class Cards extends StatelessWidget {
  
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Code Sample for material.Card',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyStatelessWidget(),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
  
//   MyStatelessWidget({Key key}) : super(key: key);

//   bool isPriority = false;
//   void _toggleFlag(){
//     setState(() {
//          if(isPriority) {
//            isPriority = false;
//          }else{
//            isPriority = true;
//          }
//         });
//         }
      
    
//       @override
//       Widget build(BuildContext context) {
//         return ListView.builder(itemCount: 5,
//         shrinkWrap: true,
//         itemBuilder: (BuildContext context,int index) => Container(
//          padding: EdgeInsets.symmetric(vertical: 10.0),
//           child: Card(
//           margin: EdgeInsets.only(left: 10.0,right: 10.0),
//           elevation: 10.0,
//             shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0)
//               ),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: <Widget>[
//                   ListTile(
//                   leading: CircleAvatar( backgroundColor: Colors.green,radius: 40.0,),
//                   trailing: new IconButton(
//                         icon: Icon(Icons.delete),
//                         iconSize: 25.0,
//                         color:(isPriority)? Colors.red : Colors.redAccent,
//                         onPressed: _toggleFlag,
//                          ),
//                   contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 3.0),
//                   title: Text('Treatment'),
//                   subtitle: Text('Details'),
//                   ),
//                Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                   new Text("Medicine Name: {Widget.value}"),
//                   Divider(),
//                     new Text("Purchased Date:{Widget.value}"),
//                   Divider(),
//                     new Text("Amount: {Widget.value}"),
//                   Divider(),
//                     new Text("Quantity: {Widget.value}"),
//                       ]),
//                 ButtonTheme.bar(
//                   // make buttons use the appropriate styles for cards
//                   child: ButtonBar(
//                     children: <Widget>[
//                       FlatButton(
//                         child: const Text('Save'),
//                         onPressed: () {/* ... */},
//                       ),
//                       FlatButton(
//                         child: const Text('Edit'),
//                         onPressed: () {/* ... */},
//                       ),
//                     ],
//                   ),
//                 ),
//                ] ),],
//             ),
//           ),
//        ));
//       }
    
//       void setState(Null Function() param0) {}
// }