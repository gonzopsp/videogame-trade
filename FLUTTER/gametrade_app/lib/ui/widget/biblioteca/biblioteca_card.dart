import 'package:flutter/material.dart';

class BibliotecaCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const BibliotecaCard({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    super.key, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.0),
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Icon(Icons.videogame_asset , size: 40 , color: Colors.red,),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey
              ),
              overflow: TextOverflow.ellipsis
            )
          ],
        ),
      ),
    );
  }
}