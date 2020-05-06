import 'package:a05/assets/colors.dart';
import 'package:a05/models/activity_model.dart';
import 'package:a05/ui_resources/Toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class EjercicioView extends StatefulWidget {
  final Ejercicio ejercicio;

  EjercicioView({
    @required this.ejercicio,
  });

  @override
  EjercicioViewState createState() => EjercicioViewState();
}

class EjercicioViewState extends State<EjercicioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: $scaffoldBackground,
          title: Text(widget.ejercicio.activityName),
        ),
        backgroundColor: $secondary,
        body: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              //Video
              Container(
                constraints: new BoxConstraints.expand(height: 200.0),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(widget.ejercicio.foto_url),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: () => _playVid(widget.ejercicio.video_url),
                  icon: Icon(
                    Icons.play_circle_outline,
                    size: 150,
                    color: Colors.grey[100],
                  ),
                ),
              ),
              //Titulo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.ejercicio.activityName,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  thickness: 3,
                ),
              ),
              // Botones y descripcion
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Duración aproximada:",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20,
                              )),
                          Text("${widget.ejercicio.duration} min",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),

                    Divider(
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    // ButtonBar
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Done
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(Icons.check,
                                    size: 50, color: $mainColor),
                                color: $mainColor,
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text("Terminamos!")),
                            ],
                          ),
                          //Not Done
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.highlight_off, size: 50)),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text("No terminamos")),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //hardocded descripcion
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Descripción:",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // actual description
                    Text(widget.ejercicio.description,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
            ])
          ],
        ));
  }

  _playVid(String vid) {
    try {
      FlutterYoutube.playYoutubeVideoByUrl(
          apiKey: "AIzaSyDXwUgcbZUE0dPPWldsa_myCONwqHvqnKk",
          videoUrl: vid,
          autoPlay: true, //default falase
          fullScreen: true //default false
          );
    } catch (Exception) {
      Toaster.showLongToast(
          "Error al cargar el video '$vid', por favor intente más tarde");
    }
  }
}
