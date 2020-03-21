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
            width: cWidth,
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
        description:
            "DESCRIPCION LARGA: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi., ",
        name: "Lenguaje",
        picturePath: "img/img4.png");
  }
}
