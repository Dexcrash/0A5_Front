import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import '../assets/colors.dart';
import 'Category.dart';
import 'package:a05/List/ActivitiesList.Dart';

class CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return _buildTabBar(context);
  }

  Widget _buildTabBar(BuildContext context) {
    return (DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: $base,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(widget.category.name),
          bottom: TabBar(tabs: [
            Tab(text: 'Detalles'),
            Tab(text: 'Actividades'),
          ]),
        ),
        body: TabBarView(
          children: [
            //Detalles
            _buildCategoryDetail(context),
            //Lista
            ActivitiesList(activities: ActivitiesList.generateTestActivities())
          ],
        ),
        //bottomNavigationBar: ,
      ),
    ));
  }

  Widget _buildCategoryDetail(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Video
          Container(
            constraints: new BoxConstraints.expand(height: 200.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(widget.category.picturePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Icon(
              Icons.play_circle_outline,
              size: 150,
              color: Colors.grey[100],
            ),
          ),
          //Titulo
          Container(
            child: Card(
              color: Colors.orange,
              margin: EdgeInsets.all(10),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(widget.category.name,
                    style: TextStyle(
                      color: $base,
                      fontSize: 40.0,
                    )),
              ),
            ),
          ),
          //Descripcion
          Container(
            padding: const EdgeInsets.all(16.0),
            width: cWidth*1.2,
            child: Text(
              widget.category.description,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesView extends StatefulWidget {
  @override
  CategoriesViewState createState() => CategoriesViewState();

  final Category category;

  CategoriesView({@required this.category});

  static Category getTestCategory() {
    return Category(
        description: "Hablar de lenguaje sería similar a " + 
        "hablar de un gran almacén de conceptos, ideas y significados que desde el " + 
        "momento del nacimiento los niños van almacenando y organizando como si de una " + 
        "biblioteca se tratara. A partir de esta biblioteca, encontramos la habilidad de " + 
        "escuchar, ordenar y añadir nuevas ideas (lenguaje comprensivo) o la habilidad de " + 
        "expresar y comunicarlas (lenguaje expresivo).\n" + 
        "Antes de la comprensión de cuentos o historias, hay muchas otras muestras de " + 
        "lenguaje comprensivo que podemos llegar a trabajar con los más pequeños de la " + 
        "casa, como la denominación de palabras o, incluso, las onomatopeyas. Rimas y " + 
        "poemas, rebotes, cosquillas, juegos con los dedos y los juegos de movimiento son " + 
        "una excelente manera de comenzar a ayudar a los niños desarrollan estas " + 
        "habilidades; además de ser divertidos, también enriquezca la experiencia " + 
        "de aprendizaje temprano de su hijo al:\n\n" + 
        "\t\t• habilidades de memoria\n" +
        "\t\t• Vocabulario\n" +
        "\t\t• Imaginación\n" +
        "\t\t• Sentido del humor\n" +
        "\t\t• Conciencia espacial\n" +
        "\t\t• Coordinación motriz\n" +
        "\t\t• Capacidad para relajarse\n\n" +
        "Juegos, rimas, meneos y cosquillas han inspirado risas y alegría en bebés, " + 
        "niños pequeños y niños pequeños para generaciones, fortaleciendo los lazos " + 
        "entre los niños y los seres queridos en sus vidas. ",
        name: "Lenguaje",
        picturePath: "img/img4.png");
  }
}
