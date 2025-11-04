import 'package:flutter/material.dart';

class PerfilTab extends StatefulWidget {
  const PerfilTab({super.key});

  @override
  State<PerfilTab> createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [           
            Text('pagina Perfil')
          ],
        ),
      ),
    );
  }
}