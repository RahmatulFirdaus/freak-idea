import 'package:flutter/material.dart';
import 'package:testing_project/pages/bodyGradiasi.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Bodygradiasi())); // Ganti dengan halaman utama Anda
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan logo Anda
            Image.network("https://cdn.discordapp.com/attachments/892554814939082793/1291784256258838628/787cc8c0af899335ed966e42b32142ec.png?ex=67020416&is=6700b296&hm=6f66ec47f14851f33cdeeb5fe9f9e4ffc288861c3525ba674767ae7dcbb943d5&"),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Menampilkan loading indicator
          ],
        ),
      ),
    );;
  }
}