import 'package:flutter/material.dart';
import 'package:videotrade_app/ui/bottom_navbar.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
  Center(child: Text("Home")),
  Center(child: Text("Community")),
  Center(child: Text("Perfil")),
  Center(child: Text("Configuración")),
  ];


  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: _pages[_selectedIndex], // <<--- muestra la página actual
        bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,)
    );
  }
}