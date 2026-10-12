
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ListBuilder(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListBuilder extends StatelessWidget {
  const ListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Builder')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Siswa ${index + 1}'),
          );
        },
      ),
    );
  }
}
