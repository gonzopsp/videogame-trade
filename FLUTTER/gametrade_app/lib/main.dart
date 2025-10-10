import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videotrade_app/models/cart.dart';
import 'package:videotrade_app/ui/main_page.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (context) => CartModel(),
  child: MainApp(),
  )
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade900,
        foregroundColor: Colors.lightBlueAccent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.lightBlueAccent,
        primary: Colors.blueGrey.shade800,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey.shade800,
          foregroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),



      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}
