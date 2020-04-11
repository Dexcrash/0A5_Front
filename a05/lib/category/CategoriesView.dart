import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import '../assets/colors.dart';
import 'Category.dart';
import 'package:a05/List/ActivitiesList.Dart';
import 'package:a05/List/ListActivity.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json;


Future<CategoryC> fetchCategory() async {
  final response = await http.get('http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/categorias/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CategoryC.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load category');
  }
}
Future<List<ListActivity>> fetchActivities() async {
  final response = await http.get('http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/categorias/1/ejercicios');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseProducts((response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load category');
  }
}
List<ListActivity> parseProducts(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<ListActivity>((json) =>ListActivity.fromJson(json)).toList(); 
} 


class CategoriesViewState extends State<CategoriesView> {
  Future<CategoryC> futureCategory;
  CategoryC test;
  Future<List<ListActivity>> futureA;
  List<ListActivity> testA;
  @override
  void initState(){
    super.initState();
    futureCategory=widget.category;
    futureA= widget.actividades;

    futureCategory.then((result) {
       test= result;

       futureA.then((result2) {

testA=result2;
       });
      setState(() {
        
      });
   
    });

  }
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
          title: Text(test.name),
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
            ActivitiesList(activities:testA)
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
                image: new AssetImage(test.picturePath),
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
                child: Text(test.name,
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
             test.description,
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

  final Future<CategoryC> category;
final Future<List<ListActivity>> actividades;

  CategoriesView({@required this.category,@required this.actividades });

  static Future<CategoryC> getTestCategory() {
    return fetchCategory();
  }
  static Future<List<ListActivity>> getActivities() {
    return fetchActivities();
  }
}

class CategoryC {
  final String description;
  final int id;
  final String picturePath;
  final String video_url;
  final String name;
  final String motivacion;

  CategoryC({this.description, this.id, this.picturePath, this.motivacion, this.name, this.video_url});


factory CategoryC.vacio(){
 return CategoryC(
      description: "",
      id: 1,
      picturePath: "",
      motivacion: "",
      name: "",
      video_url: ""
    );
}

  factory CategoryC.fromJson(Map<String, dynamic> json) {
    return CategoryC(
      description: json['descripcion'],
      id: json['id'],
      picturePath: json['foto_url'],
      motivacion: json['motivacion'],
      name: json['nombre'],
      video_url: json['video_url']
    );
  }
  
}