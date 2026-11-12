import 'package:flutter/material.dart';
import 'package:helloazisrpl2/pages/about_page.dart';
import 'package:helloazisrpl2/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, color: Colors.white, size: 18),
            ),
            SizedBox(width: 10),
            Text(
              'Raihan Muhammad Azis',
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Color(0xFF64748B)),
            tooltip: 'Notifikasi',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Color(0xFF64748B)),
            tooltip: 'Hapus',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kartu Sambutan (Welcome Banner yang Bersih)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Selamat Datang! 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Halo, raihan muhammad azis al ghifari. Semoga harimu menyenangkan!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Bagian Menu Navigasi
              const Text(
                'Menu Navigasi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 12),

              // Daftar Tombol Navigasi dengan Icon Kustom yang Rapi
              _buildMenuCard(
                title: 'Halaman About',
                subtitle: 'Informasi aplikasi dan profil',
                icon: Icons.info_outline,
                color: Colors.orange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Halaman Instagram',
                subtitle: 'Kunjungi tautan sosial media',
                icon: Icons.camera_alt_outlined,
                color: const Color(0xFFE1306C),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.instagram);
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Halaman List',
                subtitle: 'Lihat daftar item dan data',
                icon: Icons.list_alt_rounded,
                color: Colors.blue,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.list);
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Halaman Formulir',
                subtitle: 'Isi data formulir interaktif',
                icon: Icons.edit_note_rounded,
                color: Colors.blueGrey,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.formulir);
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Halaman Input',
                subtitle: 'Kelola masukan data pengguna',
                icon: Icons.input_rounded,
                color: Colors.teal,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.input);
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Halaman Album Page',
                subtitle: 'Jelajahi galeri foto dan album',
                icon: Icons.photo_album_outlined,
                color: const Color(0xFF4F46E5),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.album);
                },
              ),
              const SizedBox(height: 10),

              _buildMenuCard(
                title: 'Kantin Assalaam Food',
                subtitle: 'Pesan makanan dan minuman favoritmu',
                icon: Icons.fastfood_outlined,
                color: Colors.deepOrange,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.foodList);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        elevation: 4,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget helper untuk kartu menu yang konsisten, rapi, dan dilengkapi icon
  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.05),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF94A3B8)),
            ],
          ),
        ),
      ),
    );
  }
}