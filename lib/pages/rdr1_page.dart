import 'package:flutter/material.dart';

class rdr1 extends StatefulWidget {
  const rdr1({super.key, required this.nama_game});
  final String nama_game;
  @override
  State<rdr1> createState() => _rdr1State();
}

class _rdr1State extends State<rdr1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Edit Data"),
      ),
    );
  }
}
