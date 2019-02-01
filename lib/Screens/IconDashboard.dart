import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class DashIcons extends StatefulWidget {
  @override
  _DashIconState createState() => _DashIconState() ;
      
    }
  
  class _DashIconState extends State<DashIcons> {
    
    Material MyItems(IconData image, String heading, int color){
      
      return Material(
        
        color: Colors.white,
        elevation:14.0,
        shadowColor: Colors.yellow,
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading, style: TextStyle(
                      color: new Color(color),
                      fontSize: 10.0,
                    ),),),
                    
                    ),
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(image, color:Colors.white,size:35.0),
                      ) ,
                    )

                  ],
                )

              ],)
          ),
        ),
      ) ;   
      }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      
      body: StaggeredGridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,vertical: 10.0
        ),
        children: <Widget>[
          
          MyItems(Icons.account_box,"Farm Profile",0xffed622b),
          MyItems(Icons.account_box,"Chicken Profile",0xffed622b),
          MyItems(Icons.account_box,"Vaccine",0xffed622b),
          MyItems(Icons.account_box,"Chicken Treatment",0xffed622b),
          MyItems(Icons.account_box,"Expenses",0xffed622b),
          MyItems(Icons.account_box,"Sales",0xffed622b),
          MyItems(Icons.account_box,"Bread List",0xffed622b),
          MyItems(Icons.account_box,"Stock Out",0xffed622b),
          MyItems(Icons.account_box,"Dashboard",0xffed622b),
          
         

        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 150.0),
        ],



      ),

    );
  }
}

