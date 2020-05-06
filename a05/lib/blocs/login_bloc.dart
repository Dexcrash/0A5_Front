import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../services/repository.dart';

class LoginBloc {
  Repository repo = Repository.getInstance();


  // Tries to login a user with the given email and password
  Future<String> login(String email, String password) async {
    var bytes1 = utf8.encode(password); // data being hashed
    var digest1 = sha256.convert(bytes1); // Hashing Process
    String hashPass = digest1.toString();
    return repo.login(email, hashPass);
  }

  void saveUserId(String userId) {
    repo.saveUserId(userId);
  }

  Future<String> getUserId() async {
    return repo.getUserId();
  }

  Future<bool> isConnected() async {
    return repo.isConnected();
  }
}
