import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:videotrade_app/models/videogame.dart';

class VideojuegosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api/videogames';
  
  Future<List<Videogame>> fetchVideogames() async {

    
    final response = await http.get(Uri.parse(apiURL));

    
    if (response.statusCode == 200) {
      try {

        final dynamic decodedData = json.decode(response.body);
  
        
        List<dynamic> datos;
        
        if (decodedData is List) {
   
          datos = decodedData;
        } else if (decodedData is Map && decodedData['data'] is List) {

          datos = decodedData['data'];
        } else {
  
          throw Exception('Formato de respuesta desconocido');
        }   
        print('🎮 [DEBUG] Juegos a mapear: ${datos.length}');        
        if (datos.isNotEmpty) {
        }
        
        return datos.map((json) => Videogame.fromJson(json)).toList();
        
      } catch (e) {
        print('💥 [DEBUG] Error parsing JSON: $e');
        rethrow;
      }
    } else {
      throw Exception('Error HTTP: ${response.statusCode}');
    }
  }
}