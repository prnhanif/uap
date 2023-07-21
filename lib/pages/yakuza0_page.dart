import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class yakuza0 extends StatelessWidget {
  const yakuza0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
          )
        ],
      ),
      // Temukan game favorit mu
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Yakuza 0",
              style: GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white)),
        ),

        const SizedBox(
          height: 25,
        ),

        // search bar

        const SizedBox(
          height: 25,
        ),

        //horizontal list view
      ]),
    );
  }
}
