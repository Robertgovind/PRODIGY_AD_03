import 'package:flutter/material.dart';
import 'package:prodigy_ad_03/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      home: Home(),
    );
  }
}
