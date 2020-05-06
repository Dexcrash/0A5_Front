import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../services/repository.dart';

class CreateAccountBloc {
  Repository repo = Repository.getInstance();


  // Tries to sign in a user with the given email and password
  Future<String> signIn(String email, String password, String name, String phone, String dateOfBirth, String gender) async {
    var bytes1 = utf8.encode(password); // data being hashed
    var digest1 = sha256.convert(bytes1); // Hashing Process
    String passHash = digest1.toString();
    return repo.signIn(email, passHash, name, phone, dateOfBirth, gender);
  }

  // void signIn

  Future<bool> isConnected() async {
    return repo.isConnected();
  }
}
