import 'package:a05/List/ListActivity.dart';
import 'package:flutter/material.dart';
import 'package:a05/assets/colors.dart';
import 'package:provider/provider.dart';
import '../Profile/ProfileView.dart';
import '../Activity/ActivityView.dart';
import '../category/CategoriesView.dart';

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
                icon: const Icon(Icons.menu, color: $base), onPressed: () {},
              );
            },
          )),
      body: new Column(
        children: <Widget>[
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
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 120,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          //Carga la view de la categoria
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesView(
                                  id: "1",
                                  
                                  )
                                  
                                  
                                  ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: $base,
                      child: Column(
                        children: <Widget>[
                          Image.asset('img/img8.png',
                              height: 80, fit: BoxFit.fill),
                          Text("Habilidades de autoregulación",
                              style: TextStyle(color: $colorTitle)),
                          Text("3 a 5 años",
                              style: TextStyle(color: $colorSubtitle)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',
                            height: 80, fit: BoxFit.fill),
                        Text("Habilidades ejecutivas",
                            style: TextStyle(color: $colorTitle)),
                        Text("18 a 36 meses",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img2.png',
                            height: 80, fit: BoxFit.fill),
                        Text("Habilidades Linguisticas",
                            style: TextStyle(color: $colorTitle)),
                        Text("6 a 18 meses",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img8.png',
                            height: 80, fit: BoxFit.fill),
                        Text("Habilidades de autoregulación",
                            style: TextStyle(color: $colorTitle)),
                        Text("3 a 5 años",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png',
                            height: 80, fit: BoxFit.fill),
                        Text("Habilidades ejecutivas",
                            style: TextStyle(color: $colorTitle)),
                        Text("18 a 36 meses",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img2.png',
                            height: 80, fit: BoxFit.fill),
                        Text("Habilidades Linguisticas",
                            style: TextStyle(color: $colorTitle)),
                        Text("6 a 18 meses",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: $scaffoldBackground),
            title:
                new Text('Home', style: TextStyle(color: $scaffoldBackground)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart, color: $colorSubtitle),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: $colorSubtitle),
            title: new Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: $colorSubtitle),
            title: new Text('Perfil'),
          ),
        ],
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}