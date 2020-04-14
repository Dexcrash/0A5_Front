import 'package:flutter/foundation.dart';

/// Clase que rerpresenta una actividad para la lista de actividades

class ListActivity {
  final String thumbnail;
  final String activityName;
  final String activityCategory;
  final int duration;
  final String id;
  final String foto_url;
  final String video_url;
  ListActivity(
      {@required this.thumbnail,
      @required this.activityName,
      @required this.activityCategory,
      @required this.duration,
      @required this.id,
      @required this.foto_url,
      @required this.video_url});
      
      
      
  factory ListActivity.fromJson(Map<String, dynamic> json) {
    return ListActivity(
      activityCategory: "",
          activityName: json["nombre"],
          thumbnail: json["descripcion"],
          duration: json["duracion"],
          id: json["_id"],
          foto_url: json["foto_url"],
          video_url: json["video_url"]
    );
  }

}
