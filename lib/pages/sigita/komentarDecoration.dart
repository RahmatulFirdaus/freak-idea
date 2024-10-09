import 'package:flutter/material.dart';

class OverlappingContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Container Atas (Daftar Judul)
          Positioned(
            top: 100, // Atur posisi top sesuai kebutuhan
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // Mengatur posisi shadow
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: 100,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Judul Komentar $index'),
                    subtitle: Text('Komentar $index'),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ),

          // Container Bawah (Form Komentar)
          Positioned(
            top: 300, // Atur posisi overlap
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Masukkan Komentar',
                      prefixIcon: Icon(Icons.face),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Simpan Komentar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
