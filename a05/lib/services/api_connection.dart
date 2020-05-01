import 'dart:convert';

import 'package:a05/models/category_model.dart';
import 'package:http/http.dart' as http;


class ApiConnection {

  String baseUrl = 'http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/';

  Future<List<Category>> getAllCategories() async {
    var response = await http.get(baseUrl + 'categories');
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
    var response = await http.get(baseUrl = "categories/$id");
    if(response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      var json_cat = json.decode(response.body);
      Category cat = Category.fromJson(json_cat);
      return cat;
    }
  }

}