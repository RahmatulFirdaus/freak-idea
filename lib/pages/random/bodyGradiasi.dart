import 'package:flutter/material.dart';

class Bodygradiasi extends StatefulWidget {
  const Bodygradiasi({super.key});

  @override
  State<Bodygradiasi> createState() => _BodygradiasiState();
}

class _BodygradiasiState extends State<Bodygradiasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue, // Warna awal
              Colors.purple, // Warna akhir
            ],
            begin: Alignment.topLeft, // Titik awal gradien
            end: Alignment.bottomRight, // Titik akhir gradien
          ),
        ),
        child: Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}