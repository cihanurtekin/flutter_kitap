import 'package:flutter/material.dart';
import 'package:iller_ve_ilceler/iller.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iller(),
    );
  }
}