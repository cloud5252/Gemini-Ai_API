import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: mynewapp()));
}

class mynewapp extends StatelessWidget {
  const mynewapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}

class Scaffold extends StatefulWidget {
  const Scaffold({super.key});

  @override
  State<Scaffold> createState() => _ScaffoldState();
}

class _ScaffoldState extends State<Scaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
