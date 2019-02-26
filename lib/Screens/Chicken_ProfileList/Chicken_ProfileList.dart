import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Chicken_ProfileList/DetailForms.dart';

class ChickenProfile extends StatefulWidget{
  final String value;
  ChickenProfile({Key key,this.value}): super(key:key);
  
  static String tag = 'ChickenProfileList';
  @override
 _ChickenProfileListPageState  createState() => new _ChickenProfileListPageState();   
  }
  class _ChickenProfileListPageState extends State<ChickenProfile> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        accentColor: Colors.amber,
        brightness: Brightness.light,
      ),
      
    home: Scaffold(
        floatingActionButton: new FloatingActionButton(
            elevation: 20.0,
            highlightElevation: 20.0,
            isExtended: true,
            child: new Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.push(
                 context, MaterialPageRoute(builder: (context) => DetailApp())),
          ), 
        
    //    backgroundColor: Colors.white,
    //     body: 
    //  ListView.builder(itemCount: 50,
    //   shrinkWrap: true,
    //   itemBuilder: (BuildContext context,int index) => Container(
    //     width: MediaQuery.of(context).size.width,
    //     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 2.0),
    //    child: Card(
    //      margin: EdgeInsets.all(15.0),
    //       elevation: 5.0,
    
    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(2.0)
    //   ),
    //   color: Colors.yellow,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Container(
    //               width: 60.0,
    //               height: 65.0,
    //               color: Colors.green,
    //               child: CircleAvatar(
    //                 radius: 25.0,
    //                 backgroundColor: Colors.green,
    //                 foregroundColor: Colors.yellow,
    //                 backgroundImage: NetworkImage
    //                 ("https://www.google.com/search?q=chicken+images&rlz=1C1CHBF_enIN815IN815&tbm=isch&source=iu&ictx=1&fir=pQab4VRy_gKVlM%253A%252Cn02ibD9yVjdVZM%252C_&usg=AI4_-kTMhWDVRKAs8u3ox2RVQjz7MFiaWQ&sa=X&ved=2ahUKEwies97Du7jgAhUHf30KHR75CFoQ9QEwCnoECAAQGA#imgrc=pQab4VRy_gKVlM:"),
    //               ),
    //             ),
    //             SizedBox(width: 5.0,),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 new Text("Animal Code : ${widget.value}"),
    //                 new Text("Animal Name : ${widget.value}"),
    //                 new Text("Animal Status : ${widget.value}"),

    //               ],
    //             )
    //           ],

    //         ),
    //       ],
    //     ),
    //   ),
    // ),
   
    //  ),
    //   )
      ),
          
          
    );
       }
      //  Future DetailApp() async{

      //    ChickenProfile chicken = await Navigator.of(context).push(
      //      MaterialPageRoute(
      //        builder: (BuildContext context){
      //          return ChickenProfile();
      //        },
      //      ),
        //  );
        //  if( chicken != null){
        // initialChickens.add(chicken);

        //  }

       }
      //  }
     
     
 
