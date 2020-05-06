import 'dart:convert';
import 'dart:io';

import 'package:a05/models/activity_model.dart';
import 'package:a05/models/category_model.dart';
import 'package:a05/models/kid_model.dart';
import 'package:http/http.dart' as http;

class ApiConnection {
  String baseUrl = 'http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/';
  // String baseUrl = 'http://192.168.0.3:5000/';

  Future<List<Category>> getAllCategories() async {
    print("Api Connection: GET " + baseUrl + 'categorias');
    final response = await http.get(baseUrl + 'categorias');
    if (response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      List<Category> returnList = [];
      List<dynamic> jsonResponse = json.decode(response.body);
      for (int i = 0; i < jsonResponse.length; i++) {
        returnList.add(Category.fromJson(jsonResponse[i]));
      }
      return returnList;
    }
  }

  Future<Category> getCategoryId(int id) async {
    print("api_connection get category by id: $id");
    var response = await http.get(baseUrl + "categorias/$id");
    if (response.statusCode != 200) {
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

    if (response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      List<Ejercicio> returnList = [];
      List<dynamic> jsonResponse = json.decode(response.body);
      for (int i = 0; i < jsonResponse.length; i++) {
        returnList.add(Ejercicio.fromJson(jsonResponse[i]));
      }
      return returnList;
    }
  }

  Future<Ejercicio> getEjercicio(String id) async {
    print("api_connection get category by id: $id");
    var response = await http.get(baseUrl + "ejercicios/$id");
    if (response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      var jsonCat = json.decode(response.body);
      Ejercicio ejer = Ejercicio.fromJson(jsonCat);
      return ejer;
    }
  }

  Future<String> login(String email, String passHash) async {
    print("Loggin in or at least trying to");
    Map args = {"email": email, 'pass_hash': passHash};
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(baseUrl + 'users/login_user'));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(args)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    try {
      Map jsonReply = json.decode(reply);
      if (response.statusCode == 200) {
        return jsonReply['_id'];
      } else if (response.statusCode == 403) {
        return "Login Failed: Wrong Credentials";
      } else {
        return "Login Failed: Unexpected Error: ${response.statusCode}";
      }
    } catch (Exception) {
      if (response.statusCode == 403) {
        return "Login Failed: Wrong Credentials";
      } else {
        return "Login Failed: Unexpected Error: ${response.statusCode}";
      }
    }
  }

  Future<String> signIn(Map map) async {
    print("Signin in or at least trying to");
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(baseUrl + 'users'));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();

    if (response.statusCode == 200) {
      return "OK";
    } else if (response.statusCode == 422) {
      return "422: There's already an account with that E-Mail!";
    } else {
      return "Sign In Failed Unexpected Error: ${response.statusCode}";
    }
  }


  Future<List<Kid>> getKids(String userId) async {
    print("api_connection get kids from id: $userId");
    var response = await http.get(baseUrl + "kids/$userId");
    if (response.statusCode != 200) {
      throw Exception("Failed to connect: " + response.statusCode.toString());
    } else {
      List<Kid> returnList = [];
      List<dynamic> jsonKids = json.decode(response.body);
      for(int i = 0; i < jsonKids.length; i++) {
        returnList.add(Kid.fromMap(jsonKids[i]));
      }
      return returnList;
    }
  }

  Future<String> addKid(String nickname, String date, double peso, String userId) async {
    print("Adding Kid or at least trying to");
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(baseUrl + 'kids'));
    request.headers.set('content-type', 'application/json');
    Map map = {
      "nickname":nickname,
      "id_user": userId,
      'peso_actual': peso,
      "fecha_nacimiento": date,
      };
    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();

    if (response.statusCode == 200) {
      return "OK";
    } else if (response.statusCode == 422) {
      return "422: There's already an account with that E-Mail!";
    } else {
      return "Sign In Failed Unexpected Error: ${response.statusCode}";
    }
  }
}
