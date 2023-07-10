import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen'
        ),
      ),
    );
  }
}