
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ListCustom(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListCustom extends StatelessWidget {
  const ListCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Custom')),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: const Icon(Icons.star),
              title: Text('Item ${index + 1}'),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }
}
