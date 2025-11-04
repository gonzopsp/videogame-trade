import 'package:http/http.dart' as http;


import 'package:videotrade_app/models/genero.dart'; 


class GenerosProvider {

  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<Genero>>getGeneros() async{
    var uri = Uri.parse('$apiURL/genres');
    var respuesta = await http.get(uri);

    if(respuesta.statusCode==200){
      return genreFromJson(respuesta.body);
    }else{
      throw Exception('Falló al cargar los géneros (Código: ${respuesta.statusCode})');
    }
  }
}