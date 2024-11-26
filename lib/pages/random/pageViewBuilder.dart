import 'package:flutter/material.dart';

class Pageviewbuilder extends StatefulWidget {
  const Pageviewbuilder({super.key});

  @override
  State<Pageviewbuilder> createState() => _PageviewbuilderState();
}

class _PageviewbuilderState extends State<Pageviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('PageView Builder'),
      ),
      body: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        // physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue[100 * (index % 9)],
            child: Center(
              child: Text('Item $index', style: TextStyle(fontSize: 24)),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}