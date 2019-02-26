// import 'package:flutter/material.dart';
// import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';


// class Chickencard extends StatefulWidget {
   
//    final Chicken chicken;
    
//     Chickencard(this.chicken);

//   @override
//   _ChickencardState createState() => _ChickencardState(chicken);
// }
//    class _ChickencardState extends State<Chickencard>{
//      void initState(){
//        super.initState();
//        renderchickenpic();
//             }
//              Chicken chicken;
//              _ChickencardState(this.chicken);
       
//          @override
//          Widget build(BuildContext context) {
          
//            return Text (widget.chicken.name);
//          }
             
//              String renderUrl;
//              Widget get chickenImage{
//                return Container(
//                  width: 100.0,
//                  height:100.0,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: DecorationImage(
//                      fit: BoxFit.cover,
//                      image: NetworkImage(renderUrl ?? 'https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:'),
//                    ),
//                  ),
//                );
//              }
       
//          void renderchickenpic() async {
//            await chicken.getImageUrl();
//            setState(() {
//              renderUrl = chicken.imageUrl;
             
//            });
          

//          }
//          Widget get chickencard{
//             return Padding(
            
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

//             child:Container(
//             width: 290.0,
//     height: 115.0,
//     child: Card(
//       color: Colors.black87,
//        child: Padding(
//          padding: const EdgeInsets.only(
//           top: 8.0,
//           bottom: 8.0,
//           left: 64.0,
//         ),
//         child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Text(widget.chicken.name,
//               style: Theme.of(context).textTheme.headline),
//             Text(widget.chicken.location,
//               style: Theme.of(context).textTheme.subhead),
              
//           ]
//         )
//      )
//              )
//              )
//               );
//           }
        
// }
         
   
    
 
