import 'package:a05/assets/colors.dart';
import 'package:a05/models/kid_model.dart';
import 'package:flutter/material.dart';
import 'package:a05/services/repository.dart';



class CustomAppBar {
  String name;

  CustomAppBar(String name) {
    this.name = name;
    fKids = repo.getKids();
  }

  Repository repo = Repository.getInstance();
  Future<List<Kid>> fKids;



  List<String> names = [];
  
  Widget getAppBar() {
    return AppBar(
        backgroundColor: $scaffoldBackground,
        iconTheme: IconThemeData(color: $base),
        title: Center(child: Text(name)));
        

  }

  @override
  Widget build(BuildContext context) {
    return getAppBar();
  }
}


