import 'package:a05/main.dart';
import 'package:flutter/material.dart';
import '../assets/colors.dart';
import 'Category.dart';
import 'package:a05/List/ActivitiesList.Dart';
import 'package:a05/List/ListActivity.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json;


Future<CategoryC> fetchCategory(String id) async {
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

Future<List<ListActivity>> fetchActivities(String id) async {
  final response = await http.get('http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/categorias/1/ejercicios');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseActivities((response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load category');
  }
}
List<ListActivity> parseActivities(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
  var u= parsed.map<ListActivity>((json) =>ListActivity.fromJson(json)).toList(); 
   return u;
} 


class CategoriesViewState extends State<CategoriesView> {
Future<CategoryC> fcategory;
Future<List<ListActivity>> factividades;

  @override
  void initState(){
    super.initState();
    setState(() {
      fcategory= fetchCategory(widget.id);
    factividades= fetchActivities(widget.id);
    
    });
    
  }
  @override
  Widget build(BuildContext context) {
   return _buildTabBar(context);
 
    
  }



  Widget _buildTabBar(BuildContext context) {
    return (DefaultTabController(
      length: 2,
      child:  new FutureBuilder(
  future: Future.wait([fcategory, factividades]).then(
    (response){
      return new CategoryGeneral(category: response[0], actividades: response[1]);
    } 
  ),
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
            ActivitiesList(activities: snapshot.data.actividades, category: snapshot.data.category.name)
          ],
        ),
        //bottomNavigationBar: ,
      );
            
       }
            else{
return Scaffold(
        backgroundColor: $base,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          
        ),
        body: Center(
          child: new CircularProgressIndicator())
        //bottomNavigationBar: ,
      );






            }
    
    
    }
    )));
  }

  Widget _buildCategoryDetail(BuildContext context,  AsyncSnapshot<CategoryGeneral> snapshot) {
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
            width: cWidth*1.2,
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

  final String id;

  CategoriesView({ @required this.id });

  
}
class CategoryGeneral {
  
  CategoryC category;
  List<ListActivity> actividades;

CategoryGeneral({this.category, this.actividades});
  
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
      id: json['_id'],
      picturePath: json['foto_url'],
      motivacion: json['motivacion'],
      name: json['nombre'],
      video_url: json['video_url']
    );
  }
  
}