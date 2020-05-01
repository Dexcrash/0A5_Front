import 'package:a05/assets/colors.dart';
import 'package:a05/category/CategoriesView.dart';
import 'package:a05/models/category_model.dart';
import 'package:a05/services/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui_resources/bottom_navbar.dart';

class CategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CatListState();
  }
}

class CatListState extends State<CategoryList> {
  Repository repo = Repository();
  Future<List<Category>> cats;
  @override
  void initState() {
    cats = repo.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorías"),
        backgroundColor: Colors.orange,
      ),
      body: _body(context),
      bottomNavigationBar: NavBar(index: 2),
      backgroundColor: $secondary,
    );
  }

  Widget _body(BuildContext context) {
    return FutureBuilder(
        future: cats,
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (!snapshot.hasData) {
            return Text("Buscando Categorías");
          } else {
            return _buildCatList(context, snapshot);
          }
        });
  }

  Widget _buildCatList(
      BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                  onPressed:() =>  _goToCat(snapshot.data[index].id),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(snapshot.data[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700],
                            )),
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  _goToCat(int index) {
    Navigator.push(
        //Carga la view de la categoria
        context,
        MaterialPageRoute(
            builder: (context) => CategoriesView(
                  id: index,
                )));
  }
}
