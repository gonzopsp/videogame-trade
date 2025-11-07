import 'package:provider/provider.dart';
import 'package:videotrade_app/models/videogame.dart';
import 'package:videotrade_app/providers/videojuegos_provider.dart';
import 'package:videotrade_app/providers/ofertas_provider.dart'; 
import 'package:videotrade_app/ui/pages/carrito_page.dart';
import 'package:videotrade_app/ui/widget/tienda/game_card.dart';
import 'package:videotrade_app/models/cart.dart';
import 'package:flutter/material.dart';


import 'package:videotrade_app/ui/widget/tienda/generos_card.dart';
import 'package:videotrade_app/ui/widget/tienda/ofertas_card.dart';

class TiendaTab extends StatefulWidget {

  final Future<void> Function()? onSignOut;
  const TiendaTab({super.key, this.onSignOut}); 
  @override
  State<TiendaTab> createState() => _TiendaTabState();
}
class _TiendaTabState extends State<TiendaTab> {
  late Future<List<Videogame>> videojuegosFuture;
  VideojuegosProvider juegosProvider = VideojuegosProvider();

  @override
  void initState(){
    super.initState();
    videojuegosFuture = juegosProvider.fetchVideogames();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OfertasProvider>(context, listen: false).cargarOfertas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Videogame>>(
      future: videojuegosFuture,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty){
          return const Center(child: Text('No hay videojuegos disponibles'));
        } else{
          final videojuegos = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.account_circle), 
              title: const Text('TIENDA BKN'),
              actions: [
                Row(
                  children: [
                    const Icon(Icons.notifications_none_outlined),
                    const SizedBox(width: 10),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'signOut') {
                          widget.onSignOut?.call();
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'signOut',
                          child: Text('Cerrar Sesión'),
                        ),
                      ],
                      icon: const Icon(Icons.settings),
                    ),
                    const SizedBox(width: 10), 

                  ],

                ),

              ],

            ),

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right_alt, color: Colors.white),
                      Text(
                        '  Generos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ),
                GenerosCard(),
 /*
                Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            '  Ofertas',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white
                            ),
                          ),
                          Icon(Icons.arrow_right_alt, color: Colors.white)
                        ],
                      ),
                    ),
                   
                    Consumer<OfertasProvider>(
                      builder: (context, ofertasProvider, child) {
                        if (ofertasProvider.loading) {
                          return Container(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        
                        if (ofertasProvider.error != null) {
                          return Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                'Error: ${ofertasProvider.error}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        
                        if (ofertasProvider.ofertas.isEmpty) {
                          return Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                'No hay ofertas disponibles',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        
                        return Container(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ofertasProvider.ofertas.length,
                            itemBuilder: (context, index) {
                              final oferta = ofertasProvider.ofertas[index];
                              return Container(
                                width: 280,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: OfertasCard(oferta: oferta),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    */
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        '  Juegos Populares', 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                        ),
                      ),
                      Icon(Icons.arrow_right_alt_outlined, color: Colors.white)
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: videojuegos.length,
                    itemBuilder: (context, index){
                      final juego = videojuegos[index];
                      return GameCard(
                        id: juego.id,
                        title: juego.nombre, 
                        imageUrl: juego.images.first, 
                        description: juego.descripcion,
                        price: juego.precio,
                      );
                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey.shade800,
              foregroundColor: Colors.lightBlueAccent,
              elevation: 6,
              icon: const Icon(Icons.shopping_cart),
              label: Consumer<CartModel>(
                builder: (context, cart, child){
                  return Text(
                    'Carrito (${cart.itemCount})', 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CarritoPage()));
              },
            ),
          );
        }
      }
    );
  }
}