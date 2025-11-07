// lib/main_page.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:videotrade_app/ui/bottom_navbar.dart';
import 'package:videotrade_app/ui/pages/tabs/biblioteca_tab.dart';
import 'package:videotrade_app/ui/pages/tabs/comunidad_tab.dart';
import 'package:videotrade_app/ui/pages/tabs/perfil_tab.dart';
import 'package:videotrade_app/ui/pages/tabs/tienda_tab.dart';
import 'package:videotrade_app/auth_gate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  Future<void> _signOut() async {

    try {
      await FirebaseAuth.instance.signOut();
      print("Se ha cerrado sesión de manera exitosa!");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const AuthGate(),
        ),
        (Route<dynamic> route) => false, 
      );

    } catch (e) {
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fallo al cerrar sesión. Por favor intente nuevamente.')),
      );
    }
  }
  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    
    final List<Widget> pagesWithSignOut = [
      TiendaTab(onSignOut: _signOut), 
      const ComunidadTab(),
      const BibliotecaTab(),
      const PerfilTab()
    ];

    return Scaffold(
      body: pagesWithSignOut[_selectedIndex], 
      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
