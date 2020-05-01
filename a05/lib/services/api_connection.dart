import 'dart:convert';
import 'dart:io';

import 'package:a05/models/activity_model.dart';
import 'package:a05/models/category_model.dart';
import 'package:http/http.dart' as http;


class ApiConnection {

  // String baseUrl = 'http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/';
  String baseUrl = 'http://192.168.0.3:5000/';

  Future<List<Category>> getAllCategories() async {
    print("Api Connection: GET " + baseUrl + 'categorias');
    final response = await http.get(baseUrl + 'categorias');
    if(response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      List<Category> returnList = [];
      List<dynamic> jsonResponse = json.decode(response.body);
      for(int i = 0; i < jsonResponse.length; i++) {
        returnList.add(Category.fromJson(jsonResponse[i]));
      } 
      return returnList;
    }

  }

  Future<Category> getCategoryId(int id) async {
    print("api_connection get category by id: $id");
    var response = await http.get(baseUrl + "categorias/$id");
    if(response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      var jsonCat = json.decode(response.body);
      Category cat = Category.fromJson(jsonCat);
      return cat;
    }
  }

  Future<List<Ejercicio>> getActivitiesByCat(int id) async {
    print("api_connection get activities from category id: $id");
    var response = await http.get(baseUrl + "categorias/$id/ejercicios");

    if(response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      List<Ejercicio> returnList = [];
      List<dynamic> jsonResponse = json.decode(response.body);
      for(int i = 0; i < jsonResponse.length; i++) {
        returnList.add(Ejercicio.fromJson(jsonResponse[i]));
      } 
      return returnList;
    }
  }

  Future<Ejercicio> getEjercicio(String id) async {
    print("api_connection get category by id: $id");
    var response = await http.get(baseUrl + "ejercicios/$id");
    if(response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      var jsonCat = json.decode(response.body);
      Ejercicio ejer = Ejercicio.fromJson(jsonCat);
      return ejer;
    }
  }
}