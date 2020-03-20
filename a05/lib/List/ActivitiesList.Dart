import 'package:flutter/material.dart';
import 'ListActivity.dart';

/// Carga una list view con las actividades que le pasan por parametro al 
/// inicializar el widget
class ActivitiesList extends StatefulWidget {
  final List<ListActivity> activities;

  ActivitiesList({
    @required this.activities,
  });

  @override
  _ActivitiesListState createState() => _ActivitiesListState();

  static List<ListActivity> generateTestActivities() {
    return [
      ListActivity(
          activityCategory: "Cognitivo",
          activityName: "Contar Numeritos",
          thumbnail: "assets/image_1.jpg",
          duration: "5 min"),
      ListActivity(
          activityCategory: "Cognitivo",
          activityName: "Contar Dedos",
          thumbnail: "assets/image_1.jpg",
          duration: "6 min"),
      ListActivity(
          activityCategory: "Cognitivo",
          activityName: "Contar Cubos",
          thumbnail: "assets/image_1.jpg",
          duration: "8 min"),
      ListActivity(
          activityCategory: "Comunista",
          activityName: "Contar Camaradas",
          thumbnail: "assets/img_2.jpg",
          duration: "Para Siempre"),
    ];
  }
}

class _ActivitiesListState extends State<ActivitiesList> {
  @override
  Widget build(BuildContext context) {
    return (_buildList(context));
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

  Widget _buildTile(ListActivity activity) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(activity.activityName),
              Text(
                activity.activityCategory,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
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
                Icon(Icons.timer, color: Colors.grey),
                Text(activity.duration)
              ],
            ),
          )
        ],
      ),
    );
  }
}
