import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Button',
      home: Scaffold(
        appBar: AppBar(title: Text('YouTube Button')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => launchUrl(Uri.parse("https://www.youtube.com/@rsjsambanglihum4612")),
            child: Text('Buka YouTube'),
          ),
        ),
      ),
    );
  }

  // void _launchURL(String url) async {
  //   // Mencoba meluncurkan URL
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // Jika gagal meluncurkan URL
  //     throw 'Could not launch $url';
  //   }
  // }
}
