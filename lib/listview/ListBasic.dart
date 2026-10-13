
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ListBasic(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListBasic extends StatelessWidget {
  const ListBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram')),
      body: ListView(
        
        children: const [
          ListTile(title: Text('Apel')),
          ListTile(title: Text('Jeruk')),
          ListTile(title: Text('Mangga')),
          ListTile(title: Text('Pisang')),
        ],
      ),
    );
  }
}
