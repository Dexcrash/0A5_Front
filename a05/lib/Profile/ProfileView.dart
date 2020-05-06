import 'package:a05/main.dart';
import 'package:a05/models/kid_model.dart';
import 'package:a05/services/repository.dart';
import 'package:a05/ui_resources/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'MyChart.dart';
import 'MySeries.dart';
import 'DropDownMenu.dart';
import '../assets/colors.dart';
import "../Home/Home.dart";

class ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 3;
  Repository repo = Repository.getInstance();
  Future<List<Kid>> listaKids;

  @override
  void initState() {
    listaKids = repo.getKids();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: $mainColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _addKid(),
          )
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: NavBar(index: 3),
    );
  }

  //Solo para testear
  Widget _testStar() {
    return Icon(
      Icons.star,
      color: Colors.red[200],
    );
  }

  //La lista de prueba de datos para la grafica
  final List<MySeries> testList = [
    MySeries(
        category: "Cognitivo",
        color: charts.ColorUtil.fromDartColor(Colors.green),
        number: 2),
    MySeries(
        category: "Motriz",
        color: charts.ColorUtil.fromDartColor(Colors.blue),
        number: 3),
    MySeries(
        category: "Lenguaje",
        color: charts.ColorUtil.fromDartColor(Colors.orange),
        number: 5),
    MySeries(
        category: "Sensorial",
        color: charts.ColorUtil.fromDartColor(Colors.purple),
        number: 6),
  ];

  //Pinta el container con la imagen del nino y su info
  Widget _buildInfoNino(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Columna Imagen
            Column(
              children: <Widget>[
                Icon(
                  Icons.child_care,
                  size: 100.0,
                ),
              ],
            ),
            FutureBuilder(
              future: listaKids,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Kid>> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.length);
                  return Column(children: <Widget>[
                    DropDownMenu(
                      listKids: snapshot.data,
                    )
                  ]);
                } else {
                  return new Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ));
  }

  //Deffault Shadow
  BoxShadow boxShadow2 = BoxShadow(
      color: Colors.black54, blurRadius: 4.0, offset: Offset(1.75, 1.75));

  //Construye el counter de actividades, donde dice cuantas va y que porcentaje
  Widget _buildCounterActividades(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.orange[100],
          boxShadow: <BoxShadow>[boxShadow2],
          //borderRadius: new BorderRadius.all(new Radius.circular(10.0))
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Icono
            Icon(Icons.golf_course, color: Colors.green[400], size: 100),
            //Column con los datos, adentro vienen rows con el numero de actividades y el porcentaje
            Column(children: [
              //Banner Actividades
              Text('Actividades',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: $mainColor,
                      fontWeight: FontWeight.bold)),
              Text('5/15',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: $mainColor,
                      fontWeight: FontWeight.bold)),
              Text('33%',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green[400],
                      fontWeight: FontWeight.bold)),
            ])
          ],
        ));
  }

  //Pinta el resumen de actividades que dice actividades, el numero que va y el porcentaje
  Widget _buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
        ),
        child: ListView(children: [
          //Row con la info del nini
          _buildInfoNino(context),
          //Row que dice Resumen Semanal
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // color: $mainColor,
                    // boxShadow: [boxShadow2],
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0))),
                child: Text("Resumen Semanal",
                    style: TextStyle(fontSize: 30.0, color: $colorTitle)),
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(5.0),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          //Row que pinta el porcentaje semanal
          _buildCounterActividades(context),
          //Agrega la primera grafica
          Container(child: MyBarChart(data: testList)),
        ]));
  }

  _addKid() {
    Navigator.pushNamed(context, '/addKid');
  }
}

class ProfileView extends StatefulWidget {
  @override
  ProfileViewState createState() => ProfileViewState();
}
