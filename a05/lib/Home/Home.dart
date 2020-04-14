import 'package:a05/List/ListActivity.dart';
import 'package:a05/category/Category.dart';
import 'package:flutter/material.dart';
import 'package:a05/assets/colors.dart';
import 'package:provider/provider.dart';
import '../Profile/ProfileView.dart';
import '../Activity/ActivityView.dart';
import '../category/CategoriesView.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

Future<List<CategoryC>> fetchCategories() async {
  final response = await http.get('http://ec2-18-212-16-222.compute-1.amazonaws.com:8080/categorias');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseCategories((response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load category');
  }
}
List<CategoryC> parseCategories(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
  var u= parsed.map<CategoryC>((json) =>CategoryC.fromJson(json)).toList(); 
   return u;
} 
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
Future<List<CategoryC>> fcategories ;

@override
  void initState(){
    super.initState();
    setState(() {
      fcategories = fetchCategories();
   
    });
    
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
      body:  new FutureBuilder(
  future: Future.wait( [fcategories]).then(
    (response){
      List<CategoryC> cate=response[0];
      return cate;
    } 
  ),
  builder: (context, snapshot) {
    print(snapshot.data);
    if (snapshot.hasData) {
      
      return new Column(
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
              children:  _buildList(context, snapshot.data)
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
        ]
        );
    }
    else{
return new Center( child: CircularProgressIndicator());
        //bottomNavigationBar: ,
     
    
    }}
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
List<Widget> _buildList(BuildContext context, List<CategoryC> categories ) {
    
    List<Widget> elements=[];
    for (var i=0; i< categories.length; i++)
    {
elements.add(_buildElement(categories[i]));
    }
    
        return elements;
  }


 Widget _buildElement(CategoryC category) {

return SizedBox(
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
                          Image.asset(category.picturePath,
                              height: 80, fit: BoxFit.fill),
                          Text(category.name,
                              style: TextStyle(color: $colorTitle)),
                          Text(category.name,
                              style: TextStyle(color: $colorSubtitle)),
                        ],
                      ),
                    ),
                  ),
                );

 }

}


