class Category {
  final String description;
  final int id;
  final String picturePath;
  final String video_url;
  final String name;
  final String motivacion;

  Category({this.description, this.id, this.picturePath, this.motivacion, this.name, this.video_url});


factory Category.vacio(){
 return Category(
      description: "",
      id: 1,
      picturePath: "",
      motivacion: "",
      name: "",
      video_url: ""
    );
}

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['descripcion'],
      id: json['id'],
      picturePath: json['foto_url'],
      motivacion: json['motivacion'],
      name: json['nombre'],
      video_url: json['video_url']
    );
  }
  
}