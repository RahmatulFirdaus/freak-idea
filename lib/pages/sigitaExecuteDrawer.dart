import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetKategori {
  String kategori, id;

  GetKategori({required this.kategori, required this.id});

  static Future<List<GetKategori>> getKategori() async {
    Uri url = Uri.parse("http://192.168.3.5:86/Api/getKategori");

    var hasilResponse = await http.get(url);
    var jsonData = (jsonDecode(hasilResponse.body))["data"] as List;
    return jsonData.map((user) {
      return GetKategori(
        id: user['id'] ?? "No ID",
        kategori: user['kategori'] ?? "No Title",
      );
    }).toList();
  }
}

class Sigitaexecutedrawer extends StatefulWidget {
  const Sigitaexecutedrawer({super.key});

  @override
  State<Sigitaexecutedrawer> createState() => _SigitaexecutedrawerState();
}

class _SigitaexecutedrawerState extends State<Sigitaexecutedrawer> {
  
  List<GetKategori> dataKategori = [];
  
  @override
  void initState() {
    super.initState();
    GetKategori.getKategori().then((nilai) {
      setState(() {
        dataKategori = nilai;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Hai"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "Menu",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {},
            ),
            ExpansionTile(
              title: Text("Kategori"),
              children: [
                ListTile(
                  title: Text("${dataKategori.map((context) => context.kategori)}"),
                  onTap: () {},
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}
