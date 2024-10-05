import 'package:flutter/material.dart';
import 'package:testing_project/pages/bodyGradiasi.dart';
import 'package:testing_project/pages/formShowDialog.dart';
import 'package:testing_project/pages/pageViewBuilder.dart';
import 'package:testing_project/pages/searchMenu.dart';
import 'package:testing_project/pages/sigitaExecute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      home: Bodygradiasi()
    );
  }
}