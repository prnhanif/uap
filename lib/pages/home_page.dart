import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uap/pages/akun_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                child: const Icon(Icons.person),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const akun()),
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
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const tekken7()));
                  },
                  child: Image.asset("lib/images/tekken7.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const rdr1()));
                  },
                  child: Image.asset("lib/images/rdr cv1.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const yakuza0()));
                  },
                  child: Image.asset("lib/images/yakuza0.png"),
                ),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
