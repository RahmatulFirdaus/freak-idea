import 'package:flutter/material.dart';

class Dashboardsigitaexecute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://cdn.discordapp.com/attachments/892554814939082793/1293045388055543808/ce03c501932682fa1e0b57ce5acd1f19.png?ex=6705f1dc&is=6704a05c&hm=86f1e103c37cda130d4ac058897f560c1161077efdc3bc0c0f595e0a38a08573&'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Color Overlay
          Container(
            color: Colors.blue.withOpacity(0.7), // Adjust opacity as needed
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Selamat Datang di SIGITA',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                _buildSection(
                  icon: Icons.search,
                  title: 'Mengapa Memilih SIGITA',
                  description:
                      'SIGITA menawarkan berbagai modul pembelajaran yang mencakup semua aspek keperawatan...',
                ),

                _buildSection(
                  icon: Icons.book,
                  title: 'Modul Pembelajaran Unggulan',
                  description:
                      'Dasar-dasar Keperawatan: Memahami anatomi manusia, terminologi medis, dan teknik dasar keperawatan...',
                ),

                _buildSection(
                  icon: Icons.support_agent,
                  title: 'Dukungan Ahli',
                  description:
                      'Dapatkan bimbingan dari para ahli dan praktisi keperawatan yang berpengalaman...',
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add your YouTube button functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Cek Youtube Kami',
                    style: TextStyle(color: Colors.blue), // Text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required IconData icon, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
