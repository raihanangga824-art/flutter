
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ListSeparated(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListSeparated extends StatelessWidget {
  const ListSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Separated')),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
