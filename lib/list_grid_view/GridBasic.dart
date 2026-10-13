
import 'package:flutter/material.dart';

class Gridbasic extends StatelessWidget {
  const Gridbasic({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar HP
    var mediaQuery = MediaQuery.of(context);
    final double widthScreen = mediaQuery.size.width;
    final double heightScreen = mediaQuery.size.height;

    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: widthScreen / heightScreen,
        
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("1")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("2")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("3")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("4")),
          ),
        ],
      ),
    );
  }
}
