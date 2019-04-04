// import 'package:flutter/material.dart';
// class HorizontalList extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
    
//     return Container(
//       height: 70.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
          
//             Catogory(
           
//             image_location: 'lib/images/rooster.png' ,
//             image_caption: 'hello',
           
                      
//                     ),
//                     Catogory(
//             image_location: 'lib/images/rooster.png' ,
//             image_caption: 'hello',
                      
//                     ),
//                     Catogory(
//             image_location: 'lib/images/rooster.png' ,
//             image_caption: 'hello',
           
                      
//                     ),
//                     Catogory(
//             image_location: 'lib/images/rooster.png' ,
//             image_caption: 'hello',
                      
//                     ),
//                     Catogory(
//             image_location: 'lib/images/rooster.png' ,
//             image_caption: 'hello',
                      
//                     ),
//                   ],
//                 ),
//               );
//             }
//           }
          
//           class Catogory extends StatelessWidget {
//             final String image_location;
//             final String image_caption;
//             Catogory({
//               this.image_location,
//               this.image_caption
//             });


//   @override
//   Widget build(BuildContext context) {
    
//     return Padding(padding: const EdgeInsets.all(4.0),
//     child: InkWell( onTap:() {},
//     child: Container(
//       width: 100.0,
//     child: ListTile(
//       title: Image.asset(image_location, width: 100.0, height: 80.0,),
      
//       subtitle: Container(
//         alignment: Alignment.topCenter,   
//         child: Text(image_caption),
//       )
//     ),
//      ),
//      ) );
//   }}