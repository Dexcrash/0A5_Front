import 'package:a05/models/activity_model.dart';
import 'package:a05/models/category_model.dart';
import 'package:a05/services/repository.dart';
import 'package:flutter/material.dart';
import '../assets/colors.dart';
import 'package:a05/List/ActivitiesList.Dart';

class CategoriesViewState extends State<CategoriesView> {
  Future<Category> fcategory;
  Future<List<Ejercicio>> factividades;
  final repo = Repository();
  @override
  void initState() {
    super.initState();
    setState(() {
      fcategory = repo.getCategoryId(widget.id);
      factividades = repo.getActivitiesByCat(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTabBar(context);
  }

  Widget _buildTabBar(BuildContext context) {
    return (DefaultTabController(
        length: 2,
        child: new FutureBuilder(
            future: Future.wait([fcategory, factividades]).then((response) {
              return new CategoryGeneral(
                  category: response[0], actividades: response[1]);
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: $base,
                  appBar: AppBar(
                    backgroundColor: Colors.orange,
                    title: Text(snapshot.data.category.name),
                    bottom: TabBar(tabs: [
                      Tab(text: 'Detalles'),
                      Tab(text: 'Actividades'),
                    ]),
                  ),
                  body: TabBarView(
                    children: [
                      //Detalles
                      _buildCategoryDetail(context, snapshot),
                      //Lista
                      ActivitiesList(
                          activities: snapshot.data.actividades,
                          category: snapshot.data.category.name)
                    ],
                  ),
                  //bottomNavigationBar: ,
                );
              } else {
                return Scaffold(
                    backgroundColor: $base,
                    appBar: AppBar(
                      backgroundColor: Colors.orange,
                    ),
                    body: Center(child: new CircularProgressIndicator())
                    //bottomNavigationBar: ,
                    );
              }
            })));
  }

  Widget _buildCategoryDetail(
      BuildContext context, AsyncSnapshot<CategoryGeneral> snapshot) {
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
                image: new AssetImage(snapshot.data.category.picturePath),
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
                child: Text(snapshot.data.category.name,
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
            width: cWidth * 1.2,
            child: Text(
              snapshot.data.category.description,
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

  final int id;

  CategoriesView({@required this.id});
}

class CategoryGeneral {
  Category category;
  List<Ejercicio> actividades;

  CategoryGeneral({this.category, this.actividades});
}
