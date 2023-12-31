import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Tambah Game"),
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
                var response = await http.post(
                    Uri.parse("http://localhost:1337/api/games"),
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
