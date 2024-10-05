import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Animatedtext extends StatefulWidget {
  const Animatedtext({super.key});

  @override
  State<Animatedtext> createState() => _Animatedtext();
}

class _Animatedtext extends State<Animatedtext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue, // Warna awal
              Colors.purple, // Warna akhir
              Colors.green // Tambahkan warna ketiga jika diinginkan
            ],
            begin: Alignment.topLeft, // Titik awal gradien
            end: Alignment.bottomRight, // Titik akhir gradien
          ),
        ),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Selamat Datang',
                textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 200), // Kecepatan mengetik
              ),
            ],
          ),
        ),
      ),
    );
  }
}
