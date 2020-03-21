import 'package:a05/Actividad/ActividadDetalleView.dart';
import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../assets/colors.dart';


class ActivityViewState extends State<ActivityView> {
  int _selectedIndex = 3;
  String nameAct ="Coordinación I";

  

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: $base,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(
    color: $base
  ),
  title: const Text('Actividad', style: TextStyle(
    color: $base
  )),
      ),
      body: _buildBody(context)
   
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
          image: AssetImage("img/img7.png" )

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
                              
                              Text("Autoregulación", 
                        textAlign: TextAlign.start,
                              style: TextStyle(color: $colorSubtitle)),
                              Text("Lenguaje", 
                        textAlign: TextAlign.start,
                              style: TextStyle(color: $colorSubtitle)),


],),

IconButton(
          icon: Icon(Icons.play_circle_filled , size: 80.0),
          color: Colors.orange,
          
          onPressed: ()  {
                      Navigator.push(
                          //Carga la view de la categoria
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActividadDetalleView()));
                    },
                   
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
               SizedBox(width: 20),
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
                        Image.asset('img/img8.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Habilidades de autoregulación",
                            style: TextStyle(color: $colorTitle)),
                        Text("3 a 5 años",
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
                        Text("Habilidades ejecutivas",
                            style: TextStyle(color: $colorTitle)),
                        Text("18 a 36 meses",
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
                        Text("Habilidades Linguisticas",
                            style: TextStyle(color: $colorTitle)),
                        Text("6 a 18 meses",
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
                        Image.asset('img/img8.png',height: 80,
                        fit:BoxFit.fill),
                        Text("Habilidades de autoregulación",
                            style: TextStyle(color: $colorTitle)),
                        Text("3 a 5 años",
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
                        Text("Habilidades ejecutivas",
                            style: TextStyle(color: $colorTitle)),
                        Text("18 a 36 meses",
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
                        Text("Habilidades Linguisticas",
                            style: TextStyle(color: $colorTitle)),
                        Text("6 a 18 meses",
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
               SizedBox(width: 20),
          
             Row(children: <Widget>[
new Text("Calificaciones", textAlign: TextAlign.left,
                              style: TextStyle(color: $black, fontWeight: FontWeight.bold))    
 ,SizedBox(width: 150),
new Text("Añadir", textAlign: TextAlign.left,

                              style: TextStyle(color: $black)),
                              Icon(Icons.create, color: $colorSubtitle),
                              
                                ],)
             
             
             
             
             ],)
           ),Container(
  height: 150,
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
          image: AssetImage("img/img3.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Santiago Rodriguez", textAlign: TextAlign.left,
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
          image: AssetImage("img/img3.png" )

))),
      title: Container(
             alignment: Alignment.bottomLeft,
             child: Column(children: <Widget>[
                                Row(children: <Widget>[
new Text("Santiago Rodriguez", textAlign: TextAlign.left,
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
