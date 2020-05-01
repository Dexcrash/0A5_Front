import 'package:a05/assets/colors.dart';
import 'package:a05/models/activity_model.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:a05/Activity/ActivityView.dart';

const mainColor = Colors.orange;

/// Carga una list view con las actividades que le pasan por parametro al
/// inicializar el widget
class ActivitiesList extends StatefulWidget {
  final List<Ejercicio> activities;
  final String category;

  ActivitiesList({@required this.activities, @required this.category});

  @override
  _ActivitiesListState createState() => _ActivitiesListState();
}

class _ActivitiesListState extends State<ActivitiesList> {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      //padding: const EdgeInsets.all(16.0),
      itemCount: widget.activities.length * 2,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        return (_buildTile(widget.activities[index]));
      },
    );
  }

  BoxShadow _boxShadow2 = BoxShadow(
      color: Colors.black54, blurRadius: 4.0, offset: Offset(1.75, 1.75));

  Widget _buildTile(Ejercicio activity) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: <BoxShadow>[_boxShadow2],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Imagen
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(6.0),
                child: Image.asset(
                  activity.thumbnail,
                  height: 80,
                ),
              )
            ],
          ),
          //Text
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(activity.activityName),
              Text(
                widget.category,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )),
          //Time
          Container(
            // padding: EdgeInsets.only(10),
            margin: EdgeInsets.all(10),
            width: 60,
            height: 80,
            alignment: Alignment(0.0, 0.0),
            color: Colors.grey[200],
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.timer, color: Colors.grey),
                  //Navegar al activity detail
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityView()));
                  },
                ),
                Text("${activity.duration} min")
              ],
            ),
          )
        ],
      ),
    );
  }
}
