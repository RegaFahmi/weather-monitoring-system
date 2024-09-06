import 'package:flutter/material.dart';
import 'package:wheather/chart/chart.dart';

class Grafik extends StatefulWidget {
  const Grafik({Key? key}) : super(key: key);

  @override
  _GrafikState createState() => _GrafikState();
}

class _GrafikState extends State<Grafik> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Chart(),
    );
  }
}
