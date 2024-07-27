// card_widget.dart

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String occupation;

  CardWidget({
    required this.imagePath,
    required this.name,
    required this.occupation,
  });

    @override
  Widget build(BuildContext context) {
    double cardSize = MediaQuery.of(context).size.width * 0.2; // 20% of screen width

    return Card(
      child: Container(
        height: cardSize,
        width: cardSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: cardSize * 0.4, // 40% of card size
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: cardSize * 0.1), // Font size relative to card size
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                occupation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: cardSize * 0.1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}