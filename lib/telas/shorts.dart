import 'package:flutter/material.dart';

class Shorts extends StatefulWidget {
  const Shorts({super.key});

  @override
  State<Shorts> createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shorts",
        style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
    );
  }
  
}