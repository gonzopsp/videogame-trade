class Videogame{
  final int id;
  final int genreID;
  final String nombre;
  final String descripcion;
  final int precio;
  final List<String> images;

  Videogame({
    required this.id,
    required this.genreID,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.images,
  });


factory Videogame.fromJson(Map<String, dynamic> json){
  List<String> images = [];
  if (json['images'] != null){
    images = List<Map<String, dynamic>>.from(json['images']).map((img)=> img['image_path'] as String).toList();
  }

  return Videogame(
    id: json['id'],
    genreID: json['genreID'],
    nombre: json['name'],
    descripcion: json['description'],
    precio: json['price'], 
    images: images,
    );
  }
}