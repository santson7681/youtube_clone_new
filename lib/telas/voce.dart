import 'package:flutter/material.dart';

class Voce extends StatefulWidget {
  const Voce({super.key});

  @override
  State<Voce> createState() => _VoceState();
}

class _VoceState extends State<Voce> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: Center(
        child: Text("Voçe",
        style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
    );
  }
  
}