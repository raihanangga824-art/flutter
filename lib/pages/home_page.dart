import 'package:flutter/material.dart';
import 'package:helloazisrpl2/pages/about_page.dart';
import 'package:helloazisrpl2/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: const [
            Icon(Icons.restaurant, color: Colors.deepOrange),
            SizedBox(width: 8),
            Text(
              'Home Assalaam Food',
              style: TextStyle(color: Color(0xFF222222), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.grey),
            tooltip: 'Hapus',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B00), Color(0xFFFF9233)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Selamat Datang! 👋',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Pilih menu di bawah untuk masuk ke Kantin Assalaam Food atau navigasi lainnya.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Akses Utama Kantin Assalaam
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aplikasi Kantin Assalaam Food',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.foodList);
                        },
                        icon: const Icon(Icons.fastfood, color: Colors.white),
                        label: const Text(
                          'Buka Kantin Assalaam Food',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Daftar Tombol Navigasi Sesuai Kebutuhan Anda
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Navigasi Halaman Lainnya',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),

                    // 1. ElevatedButton (About)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AboutPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Pergi Ke Halaman About', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 2. FilledButton (Instagram)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFE1306C),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.instagram);
                        },
                        child: const Text('Pergi Ke Halaman Instagram'),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 3. OutlinedButton (List)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.deepOrange),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.list);
                        },
                        child: const Text('Pergi Ke Halaman List', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 4. FilledButton (Formulir)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.formulir);
                        },
                        child: const Text('Pergi Ke Halaman Formulir'),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 5. FilledButton (Input)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.input);
                        },
                        child: const Text('Pergi Ke Halaman Input'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // TextButton Selengkapnya
              TextButton(
                onPressed: () {},
                child: const Text('Selengkapnya', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}