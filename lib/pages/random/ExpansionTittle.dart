import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('RAHMATUL FIRDAUS'),
            accountEmail: Text('rahmatulfirdaus61@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle home navigation
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.work),
            title: Text('PKL (Praktik Kerja Lapangan)'),
            children: <Widget>[
              ListTile(
                title: Text('Pengajuan Surat Magang'),
                onTap: () {
                  // Handle navigation
                },
              ),
              ListTile(
                title: Text('Cek Pembimbing PKL'),
                onTap: () {
                  // Handle navigation
                },
              ),
              ListTile(
                title: Text('Seminar PKL'),
                onTap: () {
                  // Handle navigation
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Skripsi Menu'),
            children: <Widget>[
              // Add Skripsi sub-items here
            ],
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Cari Judul'),
            onTap: () {
              // Handle search
            },
          ),
        ],
      ),
    );
  }
}