import 'package:flutter/material.dart';

class Sliverpage extends StatefulWidget {
  const Sliverpage({super.key});

  @override
  State<Sliverpage> createState() => _SliverpageState();
}

class _SliverpageState extends State<Sliverpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Sliver App Bar')),
        ],
      ),
    );
  }
}
