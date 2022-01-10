import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  static const String routeName = "HelpScreen";
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Help"),
    );
  }
}
