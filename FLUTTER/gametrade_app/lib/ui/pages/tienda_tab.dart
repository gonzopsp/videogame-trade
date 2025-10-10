import 'package:videotrade_app/ui/widget/game_card.dart';
import 'package:flutter/material.dart';
class TiendaTab extends StatelessWidget {
  const TiendaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          Container(
            child: GameCard(
                title: 'Elden Ring',
                imageUrl: 'https://example.com/eldenring.jpg',
                price: 59.99,
              )
              ),
                ],
    );
  }
}