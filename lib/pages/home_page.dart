import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uap/game_model.dart';
import 'package:uap/network_manager.dart';
import 'package:uap/pages/cart_page.dart';
import 'package:uap/pages/library_page.dart';
import 'package:uap/pages/login_page.dart';
import 'package:uap/pages/notifikasi_page.dart';
import 'package:uap/pages/rdr1_page.dart';
import 'package:uap/pages/tekken7_page.dart';
import 'package:uap/pages/yakuza0_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Game> games = [];

  bool isLoading = false;

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    final result = await NetworkManager().getAll();
    games = result.data;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
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
                    MaterialPageRoute(builder: (context) => const cart()),
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
            } else if (value == 2) {
              //pergi ke library
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const librari()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifikasi"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_add), label: "Library"),
          ]),

      // Temukan game favorit mu
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Temukan game terbaik mu",
              style: GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white)),
        ),

        const SizedBox(
          height: 25,
        ),

        // search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Temukan game mu...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 25,
        ),

        //horizontal list view (menu game)
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(games[index].attributes.namaGame),
                  subtitle: Text(games[index].attributes.harga),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
