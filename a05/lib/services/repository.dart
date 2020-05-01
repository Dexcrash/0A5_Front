
import 'package:a05/models/activity_model.dart';
import 'package:a05/models/category_model.dart';
import 'package:a05/services/api_connection.dart';

class Repository {
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
}