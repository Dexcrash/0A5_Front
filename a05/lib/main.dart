import 'package:flutter/material.dart';
import 'package:a05/assets/colors.dart';
import 'package:provider/provider.dart';

import 'assets/colors.dart';
import 'Profile/ProfileView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Map<int, Color> swatch = {
    50: Color.fromRGBO(179, 24, 48, 0.1),
    100: Color.fromRGBO(179, 24, 48, 0.2),
    200: Color.fromRGBO(179, 24, 48, 0.3),
    300: Color.fromRGBO(179, 24, 48, 0.4),
    400: Color.fromRGBO(179, 24, 48, 0.5),
    500: Color.fromRGBO(179, 24, 48, 0.6),
    600: Color.fromRGBO(179, 24, 48, 0.7),
    700: Color.fromRGBO(179, 24, 48, 0.8),
    800: Color.fromRGBO(179, 24, 48, 0.9),
    900: Color.fromRGBO(179, 24, 48, 1)
  };
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A05',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: MaterialColor(0xffb31830, swatch),
          scaffoldBackgroundColor: $scaffoldBackground,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => MyHomePage(),
          '/home': (BuildContext context) => MyHomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileView()));
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

    print(_selectedIndex);
    return Scaffold(
      backgroundColor: $secondary,
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: $base,
          title: Text("A05", style: TextStyle(color: $colorTitle)),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: $colorTitle),
              );
            },
          )),
      body: new Column(
        children: <Widget>[
          new Text('Reciente',
              style: TextStyle(
                color: $colorTitle,
                fontSize: 30.0,
              )),
          new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 160,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png'),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png'),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img2.png'),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png'),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: $base,
                    child: Column(
                      children: <Widget>[
                        Image.asset('img/img1.png'),
                        Text("Coordinación",
                            style: TextStyle(color: $colorTitle)),
                        Text("PRIMERA INFANCIA",
                            style: TextStyle(color: $colorSubtitle)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Text('Hoy',
              style: TextStyle(
                color: $colorTitle,
                fontSize: 30.0,
              )),
          new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 450.0,
                  height: 250.0,
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
                        children: <Widget>[
                          Text("Lenguaje",
                              style: TextStyle(
                                color: $base,
                                fontSize: 25.0,
                              )),
                          Text("Entre 1 y 5 meses",
                              style: TextStyle(color: $base)),
                        ]),
                  )),
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
            title: new Text(''),
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
