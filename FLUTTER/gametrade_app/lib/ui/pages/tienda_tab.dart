import 'package:provider/provider.dart';
import 'package:videotrade_app/models/videogame.dart';
import 'package:videotrade_app/ui/pages/carrito_page.dart';
import 'package:videotrade_app/ui/widget/game_card.dart';
import 'package:videotrade_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const apiUrl= 'http://127.0.0.1:8000/api/videogames';

class TiendaTab extends StatefulWidget {
  const TiendaTab({super.key});

  @override
  State<TiendaTab> createState() => _TiendaTabState();
}

class _TiendaTabState extends State<TiendaTab> {
  late Future<List<Videogame>> videojuegosFuture;

  @override
  void initState(){
  super.initState();
  videojuegosFuture = fetchVideogames();
}
  Future<List<Videogame>> fetchVideogames() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode==200){
      final List datos = json.decode(response.body);
      return datos.map((json) => Videogame.fromJson(json)).toList();
    } else{
      throw Exception('Error al cargar los videojuegos');
    }
  }




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Videogame>>(
      future: videojuegosFuture, 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty){
          return Center(child: Text('No hay videojuegos disponibles'));
        } else{
          final videojuegos = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.account_circle),
              title: Text('TIENDA JUEGOS BKN'),
              actions: [
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.notifications_none_outlined),
                    Icon(Icons.settings)
                  ],
                ),
                
              ],
              ),
            body: 
              ListView.builder(
                itemCount: videojuegos.length,
                itemBuilder: (context, index){
                  final juego = videojuegos[index];
              
                  return GameCard(
                    id: juego.id,
                    title: juego.nombre , 
                    imageUrl: juego.images.first, 
                    price: juego.precio,
              
                    
                    );
                }),
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Colors.blueGrey.shade800,
                  foregroundColor: Colors.lightBlueAccent,
                  elevation: 6,
                  icon: const Icon(Icons.shopping_cart),
                  label: Consumer<CartModel>(builder: (context, cart, child){
                    return Text('Carrito (${cart.itemCount})', style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,),);
                  },),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CarritoPage()));
                  }),
            
          );
        }

      })
      ;
    
    
    
    
    
    
  }
}