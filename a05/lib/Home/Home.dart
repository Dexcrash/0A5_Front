import 'package:a05/category/CategoriesView.dart';
import 'package:a05/services/repository.dart';
import 'package:a05/ui_resources/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:a05/assets/colors.dart';
import '../Profile/ProfileView.dart';
import '../Activity/ActivityView.dart';
import '../models/category_model.dart';

class Home extends StatefulWidget {
  //Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  Future<List<Category>> fcategories;

  @override
  void initState() {
    fcategories = repo.getAllCategories();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileView()));
    }
    if (_selectedIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ActivityView()));
    }
  }

  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: $secondary,
      appBar: AppBar(
          // Here we take the value from the Home object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.orange,
          title: Center(
              child: Text("A05",
                  textAlign: TextAlign.center, style: TextStyle(color: $base))),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: $base),
                onPressed: () {},
              );
            },
          )),
      body: new FutureBuilder(
          future: fcategories,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return new Column(children: <Widget>[
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        new Text('Reciente',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: $colorTitle,
                              fontSize: 30.0,
                            )),
                      ],
                    )),
                SizedBox(height: 20),
                new SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _buildList(context, snapshot.data)),
                ),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        new Text('Hoy',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: $colorTitle,
                              fontSize: 30.0,
                            )),
                      ],
                    )),
                SizedBox(height: 20),
                new Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 200,
                          child: Card(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("img/img3.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("Lenguaje",
                                      style: TextStyle(
                                        color: $base,
                                        fontSize: 25.0,
                                      )),
                                  Text("18 a 36 meses",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: $base)),
                                ]),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
            } else {
              return new Center(child: CircularProgressIndicator());
              //bottomNavigationBar: ,

            }
          }),
      bottomNavigationBar: NavBar(index: 0),
    );
  }

  List<Widget> _buildList(BuildContext context, List<Category> categories) {
    List<Widget> elements = [];
    for (var i = 0; i < categories.length; i++) {
      elements.add(_buildElement(categories[i]));
    }

    return elements;
  }

  Widget _buildElement(Category category) {
    print(category.id);
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () {
          Navigator.push(
              //Carga la view de la categoria
              context,
              MaterialPageRoute(
                  builder: (context) => CategoriesView(
                        id: category.id,
                      )));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: $base,
          child: Column(
            children: <Widget>[
              Image.asset(category.picturePath, height: 80, fit: BoxFit.fill),
              Text(category.name, style: TextStyle(color: $colorTitle)),
              Text(category.name, style: TextStyle(color: $colorSubtitle)),
            ],
          ),
        ),
      ),
    );
  }
}
