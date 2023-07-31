import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uap/pages/cart_page.dart';
import 'package:uap/pages/login_page.dart';
import 'package:uap/pages/notifikasi_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uap/pages/edit_page.dart';
import 'package:uap/pages/create_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  int total = 0;
  var dataJson;

  @override
  void initState() {
    super.initState();
    _getDataFromStrapi(); // Panggil fungsi untuk memuat data saat widget di-load
  }

  void _getDataFromStrapi() async {
    var response = await http.get(Uri.parse("http://localhost:1337/api/games"));
    setState(() {
      dataJson = jsonDecode(response.body);
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //cart
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                child: const Icon(Icons.shop),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cart()),
                  );
                },
              ))
        ],
      ),

      //drawer side
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
            )
          ],
        ),
      ),

      //buttom drawer
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              //pergi ke home
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            } else if (value == 1) {
              //pergi ke notifikasi
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const notifikasi()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifikasi"),
          ]),

      // Daftar Game
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Daftar Game",
              style: GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white),
            ),
          ),
          Image.asset(
            "lib/images/rdr bg1.png",
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: total,
              itemBuilder: (context, index) {
                String nama_game =
                    dataJson["data"][index]["attributes"]["nama_game"];
                String harga = dataJson["data"][index]["attributes"]["harga"];
                int id = dataJson["data"][index]["id"];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPage(
                                nama_game: nama_game, harga: harga, id: id)));
                  },
                  title: Text(nama_game),
                  subtitle: Row(
                    children: [
                      Text(
                        "Harga: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        dataJson["data"][index]["attributes"]["harga"],
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  leading: Icon(Icons.gamepad),
                  trailing: IconButton(
                    onPressed: () async {
                      var id = dataJson["data"][index]["id"];
                      var response = await http.delete(
                        Uri.parse("http://localhost:1337/api/games/$id"),
                      );
                      _getDataFromStrapi();
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
