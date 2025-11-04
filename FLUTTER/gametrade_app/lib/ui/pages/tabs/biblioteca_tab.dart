import 'package:flutter/material.dart';
import 'package:videotrade_app/models/videogame.dart';
import 'package:videotrade_app/providers/videojuegos_provider.dart';

class BibliotecaTab extends StatefulWidget {
  const BibliotecaTab({super.key});

  @override
  State<BibliotecaTab> createState() => _BibliotecaTabState();
}

class _BibliotecaTabState extends State<BibliotecaTab> {
  final VideojuegosProvider provider = VideojuegosProvider();
  late Future<List<Videogame>> _blbliotecaFuture;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Biblioteca'),
        actions: [
          Row(
  
            children: [    
              BottomAppBar(
                child: Icon(Icons.more_vert, color: Colors.white,),
                color: Colors.blueGrey.shade900,
              )
            ],
          )
        ],

      ),
      // body: Padding(
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     children: [           
      //       GridView.builder(
      //         gridDelegate: gridDelegate, 
      //         itemBuilder: itemBuilder
      //       )
              
      //     ],
      //   ),
      // ),
    );
  }
}