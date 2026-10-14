import 'package:flutter/material.dart';
import 'package:helloazisrpl2/pages/about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Halaman Home'),
          ElevatedButton(
            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                  return AboutPage();
                },
                )
              );
            },
            child: Text('Pergi Ke Halaman About'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, '/instagram');
            },
            child: Text('Pergi Ke Halaman Instagram'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            child: Text('Pergi Ke Halaman List'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, '/formulir');
            },
            child: Text('Pergi Ke Halaman Formulir'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Selengkapnya'),
            ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}