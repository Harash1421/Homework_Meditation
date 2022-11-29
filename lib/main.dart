import 'package:flutter/material.dart';
import 'package:meditation/screens/container_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContainerScreen(),
    );
  }
}
