
import 'dart:io';

import 'package:a05/models/activity_model.dart';
import 'package:a05/models/category_model.dart';
import 'package:a05/models/kid_model.dart';
import 'package:a05/services/api_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static Repository _instance;

  static Repository getInstance() {
    if (_instance == null) {
      _instance = Repository();
    }
    return _instance;
  }
  ApiConnection api = ApiConnection();

  Future<List<Category>> getAllCategories() {
    return api.getAllCategories();
  }

  Future<Category> getCategoryId(int id) {
    return api.getCategoryId(id);
  }

  Future<List<Ejercicio>> getActivitiesByCat(int id) {
    return api.getActivitiesByCat(id);
  }

  Future<Ejercicio> getEjercicio(String id) {
    return api.getEjercicio(id);
  }

  Future<String> login(String email, String hashPass) {
    return api.login(email, hashPass);
  }

  void saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", userId);
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("user_id");
    return userId;
  }


    Future<String> signIn(String email, String passHash, String name,
      String phone, String dateOfBirth, String gender) {
    Map map = {
      "email": email,
      "pass_hash": passHash,
      "name": name,
      "phone": phone,
      "date_of_birth": dateOfBirth,
      "gender": gender
    };
    return api.signIn(map);
  }

  Future<bool> isConnected() async {
    bool r = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('connected');
        r = true;
      }
    } on SocketException catch (_) {
      // print('not connected');
      r = false;
    }
    return r;
  }

  Future<List<Kid>> getKids() async {
    return api.getKids(await getUserId());
  }

  Future<String> addKid(String nickname, String date, double peso) async {
    String idUser = await getUserId();
    return api.addKid(nickname, date, peso, idUser);
  }
}