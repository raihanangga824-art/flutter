import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Halaman About'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali"),
          ),
        ],
      ),
    );
  }
}