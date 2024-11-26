import 'package:flutter/material.dart';

class Appbargradiasi extends StatefulWidget {
  const Appbargradiasi({super.key});

  @override
  State<Appbargradiasi> createState() => _BodygradiasiState();
}

class _BodygradiasiState extends State<Appbargradiasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Tinggi AppBar
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(63, 236, 255, 1),
                Color.fromRGBO(24, 90, 125, 1)
              ], // Warna gradien
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Set transparan
            title: const Text(
              "PRACTICE",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}
