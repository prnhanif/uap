import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.nama_game,
    required this.harga,
    required this.id,
  });
  final String nama_game;
  final String harga;
  final int id;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final namaController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaController.text = widget.nama_game;
    hargaController.text = widget.harga;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Edit Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(hintText: "Nama Game"),
            ),
            TextField(
              controller: hargaController,
              decoration: const InputDecoration(hintText: "Harga"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, String> headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                };
                var response = await http.put(
                    Uri.parse("http://localhost:1337/api/games/${widget.id}"),
                    headers: headers,
                    body: jsonEncode({
                      "data": {
                        "nama_game": namaController.text,
                        "harga": hargaController.text
                      }
                    }));
                print(response.statusCode);
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
