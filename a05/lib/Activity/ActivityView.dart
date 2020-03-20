import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../assets/colors.dart';


class ActivityViewState extends State<ActivityView> {
  int _selectedIndex = 3;
  String nameAct ="Coordinación I";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
     
    });
    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: $base,
      appBar: AppBar(
        backgroundColor: $scaffoldBackground,
        iconTheme: IconThemeData(
    color: $base
  ),
  title: const Text('Actividad', style: TextStyle(
    color: $base
  )),
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: $colorSubtitle),
            title:
                new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart, color: $colorSubtitle),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: $scaffoldBackground),
            title: new Text('Activity', style: TextStyle(color:$scaffoldBackground)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: $colorSubtitle),
            title: new Text('',
                style: TextStyle(color: $colorSubtitle)),
          ),
        ],
        onTap: _onItemTapped,
      ),
   
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Column(
      
        children: <Widget>[


          
     Container(
  height: 200,
  child:Card(
                    
                      child: Container(
                    decoration: BoxDecoration(
                      color: $secondary
                    ),
                    child: Column(
                     
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:  MainAxisAlignment.start,
                        children: <Widget>[

SizedBox(height: 10),

                          Row(

                            children: <Widget>[
                              SizedBox(width: 10),
                              Container(
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("img/img3.png" )

)),
                              ),

SizedBox(width: 10),
Column( children: <Widget>[
  Text("REBOTES", 

                        textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20.0,
      color: $black, fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Row(children: <Widget>[

Column(children: <Widget>[

Text("TIPOS", 

                        textAlign: TextAlign.start,
                              style: TextStyle(color: $colorSubtitle, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              
                              Text("Coordinación", 
                        textAlign: TextAlign.start,
                              style: TextStyle(color: $colorSubtitle)),
                              Text("Lenguaje", 
                        textAlign: TextAlign.start,
                              style: TextStyle(color: $colorSubtitle)),


],),
IconButton(
          icon: Icon(Icons.play_circle_filled , size: 80.0),
          color: $scaffoldBackground,
          onPressed: () {},
        ),
      

                              ],),



],)
,                          
                            
                              
                              
                              
                              ],
                          ),


                          
                        
                        
                        
                        
                        ]),
                  )),




                )
                
                
                
,
SizedBox(height: 10),
Container(
             alignment: Alignment.centerLeft,
             child: Row(children: <Widget>[
               SizedBox(width: 10),
 new Text("Actividades Relacionadas", textAlign: TextAlign.left,
                              style: TextStyle(color: $black, fontWeight: FontWeight.bold))    
          
             ],)
           ),
SizedBox(height: 10),
new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img2.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',
                        height: 80,
                        fit:BoxFit.fill),

                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
           Container(
             alignment: Alignment.centerLeft,
             child: Row(children: <Widget>[
               SizedBox(width: 10),
 new Text("Calificaciones", textAlign: TextAlign.left,
                              style: TextStyle(color: $black, fontWeight: FontWeight.bold))    
          
             ],)
           ),Container(
  height: 100,
  child: new  ListView(
  children: <Widget>[
    ListTile(
     
      leading: Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("img/person1.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Camila Gutierrez", textAlign: TextAlign.left,
                              style: TextStyle(color: $black)),
SizedBox(width: 50),
new Text("4.5", textAlign: TextAlign.left,

                              style: TextStyle(color: $black)),
                              Icon(Icons.star, color: Colors.yellow),
                              
                                ],),
SizedBox(height: 10),
                              new Text("Las actividades fueron muy utiles para fomentar el lenguaje de mi hijo...", textAlign: TextAlign.left,
                              style: TextStyle(color: $black))
             ],)
            ),
    ),
    ListTile(
     
      leading: Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("img/person1.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Camila Gutierrez", textAlign: TextAlign.left,
                              style: TextStyle(color: $black)),
SizedBox(width: 50),
new Text("4.5", textAlign: TextAlign.left,

                              style: TextStyle(color: $black)),
                              Icon(Icons.star, color: Colors.yellow),
                              
                                ],),
SizedBox(height: 10),
                              new Text("Las actividades fueron muy utiles para fomentar el lenguaje de mi hijo...", textAlign: TextAlign.left,
                              style: TextStyle(color: $black))
             ],)
            ),
    ),
    ListTile(
     
      leading: Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("img/person1.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Camila Gutierrez", textAlign: TextAlign.left,
                              style: TextStyle(color: $black)),
SizedBox(width: 50),
new Text("4.5", textAlign: TextAlign.left,

                              style: TextStyle(color: $black)),
                              Icon(Icons.star, color: Colors.yellow),
                              
                                ],),
SizedBox(height: 10),
                              new Text("Las actividades fueron muy utiles para fomentar el lenguaje de mi hijo...", textAlign: TextAlign.left,
                              style: TextStyle(color: $black))
             ],)
            ),
    ),
    ListTile(
     
      leading: Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("img/person1.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Camila Gutierrez", textAlign: TextAlign.left,
                              style: TextStyle(color: $black)),
SizedBox(width: 50),
new Text("4.5", textAlign: TextAlign.left,

                              style: TextStyle(color: $black)),
                              Icon(Icons.star, color: Colors.yellow),
                              
                                ],),
SizedBox(height: 10),
                              new Text("Las actividades fueron muy utiles para fomentar el lenguaje de mi hijo...", textAlign: TextAlign.left,
                              style: TextStyle(color: $black))
             ],)
            ),
    ),
  ],
),),
         
         

        ]
        
    );
  }
  
  
  
}

class ActivityView extends StatefulWidget {
  @override
  ActivityViewState createState() => ActivityViewState();
}
