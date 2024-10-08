import 'package:flutter/material.dart';

class GradiantNavBody extends StatelessWidget {
  const GradiantNavBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3FECFF), // Light blue at the top
                Color(0xFF3FECFF), // Same light blue to create a solid color for AppBar
              ],
            ),
          ),
        ),
        title: const Text(
          "SIGITA",
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3FECFF), // Light blue at the top (matching AppBar)
              Color(0xFF185A7D), // Dark blue at the bottom
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Dashboard',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3FECFF), // Light blue at the top
              Color(0xFF185A7D), // Dark blue at the bottom
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
              ),
              child: const Text(
                'SIGITA Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.white),
              title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Dashboard
              },
            ),
            // ... (other ListTile items remain the same)
          ],
        ),
      ),
    );
  }
}