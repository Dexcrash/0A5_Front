import 'dart:ui';

import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import '../assets/colors.dart';
import '../Profile/ProfileView.dart';

const mainColor = Colors.orange;

class ActividadDetalleView extends StatefulWidget {
  @override
  ActividadDetalleViewState createState() => ActividadDetalleViewState();
}

class ActividadDetalleViewState extends State<ActividadDetalleView> {
  int _selectedIndex = 1;
  bool _isPushed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else if (_selectedIndex == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividad'),
        backgroundColor: mainColor,
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: $colorSubtitle),
            title:
                new Text('Home', style: TextStyle(color: $scaffoldBackground)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart, color: $colorSubtitle),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: $colorSubtitle),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: $scaffoldBackground),
            title: new Text('Perfil',
                style: TextStyle(color: $scaffoldBackground)),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  //Pinta el resumen de actividades que dice actividades, el numero que va y el porcentaje
  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
      ),
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage('img/img5.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(children: <Widget>[
                      (_isPushed)
                          ? FlatButton.icon(
                              onPressed: () {
                                setState(() {
                                  _isPushed = false;
                                });
                              },
                              icon: Icon(Icons.pause_circle_outline,
                                  color: Colors.orange, size: 80),
                              label: Text('pause'))
                          : FlatButton.icon(
                              onPressed: () {
                                setState(() {
                                  _isPushed = true;
                                });
                              },
                              icon: Icon(Icons.play_circle_outline,
                                  color: Colors.orange, size: 80),
                              label: Text('play'))
                    ]),
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          'Actividad 1: ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ]),
                      Row(
                        children: <Widget>[
                          Text(
                            'Rebotes (Sienta al niño en tus piernas)',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
        Container(
          padding: EdgeInsets.only(left: 20, top: 30),
          child: Text(
            '''Canta las frases, mientras realizas las acciones:

Te rebotó aquí,

Te rebotó aquí, te rebotó allá (rebota al niño de rodillas)

Te rebtó, rebote, en todas partes.

Te hago cosquillas aquí, te hago cosquillas allí ( suavemente cosquillas al niño)

Te hago cosquillas, te hago cosquillas en todas partes

Te abrazo aquí, te abrazo allá. (abrazo al niño)

Te abrazo, te abrazo en todas partes''',
            textAlign: TextAlign.left,
            textWidthBasis: TextWidthBasis.parent,
          ),
        )
      ]),
    );
  }
}
