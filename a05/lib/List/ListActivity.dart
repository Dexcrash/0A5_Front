import 'package:flutter/foundation.dart';

/// Clase que rerpresenta una actividad para la lista de actividades

class ListActivity {
  final String thumbnail;
  final String activityName;
  final String activityCategory;
  final String duration;

  ListActivity(
      {@required this.thumbnail,
      @required this.activityName,
      @required this.activityCategory,
      @required this.duration});
}
